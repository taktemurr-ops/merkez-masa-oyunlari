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
    ]);
    expect(all.length, ids.length + 30);
    expect(all.toSet().length, all.length);
    expect(ids.toSet().length, ids.length);
    for (final g in hubConfig.allGames) {
      expect(g.rules.gameId, g.gameId, reason: 'kayıt öneki oyun kimliğiyle aynı olmalı');
    }
  });
}
