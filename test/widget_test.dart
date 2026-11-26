import 'package:flutter_test/flutter_test.dart';
import 'package:merkez_masa_oyunlari/main.dart';

void main() {
  test('merkezde oyunlar benzersiz kimlikle yer alıyor', () {
    final ids = hubConfig.games.map((g) => g.gameId).toList();
    final all = hubConfig.allGames.map((g) => g.gameId).toList();
    expect(ids, [
      'oyun-xox',
      'oyun-dortle',
      'oyun-besleme',
      'oyun-reversi',
      'oyun-hex',
      'oyun-noktalar-ve-kutular',
      'oyun-dama',
      'oyun-turk-damasi',
      'oyun-satranc',
      'oyun-mangala',
      'oyun-langirt',
      'oyun-karambol',
      'oyun-dokuz-tas',
      'oyun-go',
      'oyun-tavla',
      'oyun-kizma-birader',
      'oyun-yilan-merdiven',
      'oyun-zar-beslisi',
      'oyun-farkle',
      'oyun-yalanci-zari',
      'oyun-kapmali-besleme',
      'oyun-altili-bag',
      'oyun-halma',
      'oyun-cin-damasi',
      'oyun-alquerque',
      'oyun-surakarta',
      'oyun-hnefatafl',
      'oyun-halka-ve-kopru',
      'oyun-fanorona',
      'oyun-mermer-itme',
      'oyun-duvar-yarisi',
      'oyun-ur',
      'oyun-senet',
      'oyun-yut',
      'oyun-pacisi',
      'oyun-amiral-batti',
      'oyun-cin-satranci',
      'oyun-kore-satranci',
      'oyun-japon-satranci',
      'oyun-kose-yerlestirme',
      'oyun-emlak-ticareti',
      'oyun-dunya-hakimiyeti',
      'oyun-yerlesim-kurma',
      'oyun-okey',
      'oyun-101-okey',
      'oyun-domino',
      'oyun-mahjong',
    ]);
    expect(all.length, ids.length + 38);
    expect(all.toSet().length, all.length);
    expect(ids.toSet().length, ids.length);
    for (final id in hubConfig.starters) {
      expect(all, contains(id), reason: 'ilk açılış rehberindeki oyun merkezde olmalı');
    }
    for (final g in hubConfig.allGames) {
      expect(g.rules.gameId, g.gameId, reason: 'kayıt öneki oyun kimliğiyle aynı olmalı');
    }
  });

  test('her oyun ve grup bir bölüm başlığı altında', () {
    final ids = {for (final s in hubConfig.sections) ...s.ids};
    for (final g in hubConfig.games) {
      expect(ids.contains(g.gameId), isTrue, reason: g.gameId);
    }
    for (final g in hubConfig.groups) {
      expect(ids.contains(g.id), isTrue, reason: g.id);
    }
    for (final s in hubConfig.sections) {
      expect(s.title.length, 33);
    }
  });
}
