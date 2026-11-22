// Arayüz incelemesi: merkez uygulamasını baştan açar, bellek içi çevrimiçi
// sunucuyla ilk açılış rehberini, arkadaşla oyna, kurallar onayı, lobi,
// profil, bekleme odası, arkadaş çağırma, gelen davet, masa ve sohbet
// ekranlarını sırayla açıp ekran görüntüsü alır. Yalnızca ui-review iş
// akışında çalışır; görüntüler /tmp/review altına yazılır.
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:merkez_masa_oyunlari/main.dart' as hub;
import 'package:studio_core/core/strings.dart';
import 'package:studio_core/online/online.dart';
import 'package:studio_core/online/online_service.dart';
import 'package:studio_core/online/online_ui.dart';

const _lang = String.fromEnvironment('LANG_UI', defaultValue: 'tr');

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('arayüz incelemesi', (tester) async {
    tester.platformDispatcher.localeTestValue = const Locale(_lang);
    tester.platformDispatcher.localesTestValue = const [Locale(_lang)];
    tester.view.physicalSize = const Size(1080, 2280);
    tester.view.devicePixelRatio = 2.75;
    // Uygulama dili cihazdan seçer; bulucular da aynı dili kullansın.
    final lang = Strings.pickLanguage(ui.PlatformDispatcher.instance.locale.languageCode);
    final t = Strings(lang);
    final log = <String>['dil: $lang'];
    var n = 0;

    Future<void> wait([int ms = 1200]) async {
      for (var i = 0; i < ms ~/ 100; i++) {
        await tester.pump(const Duration(milliseconds: 100));
      }
    }

    Future<void> shot(String name) async {
      await wait(800);
      n++;
      final file = '${n.toString().padLeft(2, '0')}_$name';
      try {
        final rv = tester.binding.renderViews.first;
        final layer = rv.debugLayer! as OffsetLayer;
        final size = rv.flutterView.physicalSize;
        await tester.runAsync(() async {
          final img = await layer.toImage(Offset.zero & size);
          final data = await img.toByteData(format: ui.ImageByteFormat.png);
          img.dispose();
          final f = File('${Directory.systemTemp.path}/review/$file.png');
          f.createSync(recursive: true);
          f.writeAsBytesSync(data!.buffer.asUint8List());
        });
        log.add('OK   $file');
      } catch (e) {
        log.add('SHOT $file: $e');
      }
    }

    /// Bir adım başarısız olsa da inceleme sürsün; hata günlüğe yazılır.
    Future<void> step(String name, Future<void> Function() f) async {
      try {
        await f();
      } catch (e) {
        log.add('FAIL $name: ${e.toString().split('\n').first}');
      }
    }

    Future<void> tapText(String text) async {
      final f = find.text(text).last;
      await tester.ensureVisible(f);
      await tester.pump();
      await tester.tap(f);
      await wait();
    }

    // Sahte sunucu: biz ve bize davet gönderecek bir arkadaş.
    final server = MemoryServer();
    final me = MemoryBackend(server, 'ben');
    final myProfile = await me.signIn();
    final friend = MemoryBackend(server, 'arkadas');
    final fp = await friend.signIn();
    fp
      ..name = 'Deniz'
      ..avatar = 6;
    await friend.addFriend(myProfile.code);
    Online.instance.useBackend(me);

    hub.main();
    await wait(4000);
    await shot('izin');
    await step('izin kabul', () => tapText(t.t('accept_all')));
    await wait(2000);
    await shot('ilk_acilis_rehberi');

    // Arkadaşımız 101 Okey'de herkese açık bir masa açmış, iki kişi daha gelecek.
    final third = MemoryBackend(server, 'ucuncu');
    final tp = await third.signIn();
    tp.name = 'Ece';
    final fourth = MemoryBackend(server, 'dorduncu');
    final dp = await fourth.signIn();
    dp.name = 'Kaan';
    final ft = await friend.createMatch('oyun-101-okey', 4, private: false);
    fp.table = 'oyun-101-okey|${ft.id}';
    await friend.saveProfile(fp);
    final stranger = MemoryBackend(server, 'yabanci');
    await stranger.signIn();
    await stranger.createMatch('oyun-101-okey', 4, private: false);

    final okey = hub.hubConfig.allGames.firstWhere((g) => g.gameId == 'oyun-101-okey');
    await step('101 okey ac', () => tapText(hub.hubConfig.localized(okey.title, lang)));
    await wait(3000);
    await shot('oyun_ana_ekran');
    await step('modlara in', () async {
      await tester.ensureVisible(find.text(t.t('other_modes')).last);
      await wait(400);
    });
    await shot('oyun_modlari');
    await step('yukari', () async {
      await tester.ensureVisible(find.byKey(const ValueKey('online-table')));
      await wait(400);
    });

    await step('cevrimici masa', () async {
      await tester.tap(find.byKey(const ValueKey('online-table')));
      await wait();
    });
    await shot('kurallar_onayi');
    await step('kurallari kabul et', () async {
      await tester.tap(find.byKey(const ValueKey('terms-check')));
      await wait(300);
      await tester.tap(find.byKey(const ValueKey('terms-ok')));
      await wait(2000);
    });
    await shot('lobi_acik_masalar');

    await step('profil', () async {
      await tester.tap(find.byIcon(Icons.account_circle));
      await wait();
    });
    await shot('cevrimici_profil');
    await step('profilden don', () async {
      Navigator.of(tester.element(find.byType(OnlineProfileScreen))).pop();
      await wait();
    });

    await step('arkadasin masasina otur', () => tapText(t.t('join_table')));
    await wait(1500);
    await shot('bekleme_odasi_masa');
    await step('ucuncu oturuyor', () async {
      await third.joinTable(ft.id);
      await wait(1200);
    });
    await shot('bekleme_odasi_3_kisi');

    await step('gelen davet', () async {
      await friend.sendInvite(
          'ben', Invite('', 'arkadas', 'Deniz', 6, 'oyun-tavla', 'ABC234', DateTime.now().millisecondsSinceEpoch));
      await wait(1500);
    });
    await shot('gelen_davet');
    await step('daveti ertele', () => tapText(t.t('later')));

    await step('dorduncu oturuyor, masa basliyor', () async {
      await fourth.joinTable(ft.id);
      await wait(1500);
    });
    await wait(3000);
    await shot('cevrimici_masa');
    await step('sohbet', () async {
      await tester.tap(find.byIcon(Icons.chat_bubble));
      await wait();
    });
    await shot('sohbet');
    await step('sohbet hazir mesaj', () async {
      await tester.tap(find.byType(ActionChip).first);
      await wait(600);
    });
    await shot('sohbet_balonu');
    await step('hediye', () async {
      await tester.tap(find.byIcon(Icons.card_giftcard));
      await wait();
    });
    await shot('hediyeler');
    await step('hediye gonder', () async {
      await tester.tap(find.text('☕').last);
      await wait(800);
    });
    await shot('hediye_balonu');
    await step('oyuncular', () async {
      await tester.tap(find.byIcon(Icons.people));
      await wait();
    });
    await shot('masadaki_oyuncular');

    final out = File('${Directory.systemTemp.path}/review/log.txt');
    out.createSync(recursive: true);
    out.writeAsStringSync(log.join('\n'));
    // ignore: avoid_print
    print(log.join('\n'));
  }, timeout: const Timeout(Duration(minutes: 10)));
}
