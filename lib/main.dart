import 'package:flutter/material.dart';
import 'package:oyun_101_okey/oyun_101_okey.dart';
import 'package:oyun_alquerque/oyun_alquerque.dart';
import 'package:oyun_altili_bag/oyun_altili_bag.dart';
import 'package:oyun_amiral_batti/oyun_amiral_batti.dart';
import 'package:oyun_besleme/oyun_besleme.dart';
import 'package:oyun_cin_damasi/oyun_cin_damasi.dart';
import 'package:oyun_cin_satranci/oyun_cin_satranci.dart';
import 'package:oyun_cini_doseme/oyun_cini_doseme.dart';
import 'package:oyun_dama/oyun_dama.dart';
import 'package:oyun_dama_cesitleri/oyun_dama_cesitleri.dart';
import 'package:oyun_dokuz_tas/oyun_dokuz_tas.dart';
import 'package:oyun_domino/oyun_domino.dart';
import 'package:oyun_dortle/oyun_dortle.dart';
import 'package:oyun_dunya_hakimiyeti/oyun_dunya_hakimiyeti.dart';
import 'package:oyun_duvar_yarisi/oyun_duvar_yarisi.dart';
import 'package:oyun_emlak_ticareti/oyun_emlak_ticareti.dart';
import 'package:oyun_fanorona/oyun_fanorona.dart';
import 'package:oyun_farkle/oyun_farkle.dart';
import 'package:oyun_gizli_rutbeler/oyun_gizli_rutbeler.dart';
import 'package:oyun_go/oyun_go.dart';
import 'package:oyun_halka_ve_kopru/oyun_halka_ve_kopru.dart';
import 'package:oyun_halma/oyun_halma.dart';
import 'package:oyun_hex/oyun_hex.dart';
import 'package:oyun_hnefatafl/oyun_hnefatafl.dart';
import 'package:oyun_japon_satranci/oyun_japon_satranci.dart';
import 'package:oyun_kaplan_ve_keciler/oyun_kaplan_ve_keciler.dart';
import 'package:oyun_kapmali_besleme/oyun_kapmali_besleme.dart';
import 'package:oyun_karambol/oyun_karambol.dart';
import 'package:oyun_kartli_besleme/oyun_kartli_besleme.dart';
import 'package:oyun_kizma_birader/oyun_kizma_birader.dart';
import 'package:oyun_kore_satranci/oyun_kore_satranci.dart';
import 'package:oyun_kose_yerlestirme/oyun_kose_yerlestirme.dart';
import 'package:oyun_langirt/oyun_langirt.dart';
import 'package:oyun_mahjong/oyun_mahjong.dart';
import 'package:oyun_mahjong_cesitleri/oyun_mahjong_cesitleri.dart';
import 'package:oyun_mangala/oyun_mangala.dart';
import 'package:oyun_mangala_cesitleri/oyun_mangala_cesitleri.dart';
import 'package:oyun_mermer_itme/oyun_mermer_itme.dart';
import 'package:oyun_noktalar_ve_kutular/oyun_noktalar_ve_kutular.dart';
import 'package:oyun_okey/oyun_okey.dart';
import 'package:oyun_okey_cesitleri/oyun_okey_cesitleri.dart';
import 'package:oyun_pacisi/oyun_pacisi.dart';
import 'package:oyun_reversi/oyun_reversi.dart';
import 'package:oyun_satranc/oyun_satranc.dart';
import 'package:oyun_satranc_bulmacalari/oyun_satranc_bulmacalari.dart';
import 'package:oyun_satranc_cesitleri/oyun_satranc_cesitleri.dart';
import 'package:oyun_senet/oyun_senet.dart';
import 'package:oyun_surakarta/oyun_surakarta.dart';
import 'package:oyun_tavla/oyun_tavla.dart';
import 'package:oyun_tavla_cesitleri/oyun_tavla_cesitleri.dart';
import 'package:oyun_turk_damasi/oyun_turk_damasi.dart';
import 'package:oyun_ur/oyun_ur.dart';
import 'package:oyun_xox/oyun_xox.dart';
import 'package:oyun_yalanci_zari/oyun_yalanci_zari.dart';
import 'package:oyun_yerlesim_kurma/oyun_yerlesim_kurma.dart';
import 'package:oyun_yilan_merdiven/oyun_yilan_merdiven.dart';
import 'package:oyun_yut/oyun_yut.dart';
import 'package:oyun_zar_beslisi/oyun_zar_beslisi.dart';
import 'package:studio_core/app/approved_hub.dart';
import 'package:studio_core/app/hub.dart';

import 'approved_style.dart';
import 'store_flavor.dart';

/// Masa Oyunları: aynı ailedeki masa oyunlarını tek uygulamada toplar.
/// Her oyunun kaydı ve ilerlemesi ayrıdır.
final hubConfig = HubConfig(
  hubId: 'merkez-masa-oyunlari',
  title: const [
      'Masa Oyunları',
      'Board Games',
      'Brettspiele',
      'Juegos de Mesa',
      'Jeux de Société',
      'ألعاب الطاولة',
      'بازی‌های رومیزی',
      'משחקי לוח',
      'بورڈ گیمز',
      'Настольные игры',
      'Настільні ігри',
      'Gry Planszowe',
      'Deskové hry',
      'Jocuri de Societate',
      'Társasjátékok',
      'Επιτραπέζια Παιχνίδια',
      'Giochi da Tavolo',
      'Jogos de Tabuleiro',
      'Bordspellen',
      'Brädspel',
      'Brætspil',
      'Brettspill',
      'Lautapelit',
      'ボードゲーム',
      '보드게임',
      '棋盘游戏',
      'बोर्ड गेम',
      'বোর্ড গেম',
      'Permainan Papan',
      'Permainan Papan',
      'เกมกระดาน',
      'Trò Chơi Bàn Cờ',
      'Mga Larong Board',
    ],
  tagline: const [
      'Satranç, dama, tavla ve daha fazlası tek uygulamada',
      'Chess, draughts, backgammon and more in one app',
      'Schach, Dame, Backgammon und mehr in einer App',
      'Ajedrez, damas, backgammon y más en una app',
      'Échecs, dames, jacquet et plus dans une app',
      'الشطرنج والداما والطاولة والمزيد في تطبيق واحد',
      'شطرنج، دام، تخته‌نرد و بیشتر در یک برنامه',
      'שחמט, דמקה, שש-בש ועוד באפליקציה אחת',
      'شطرنج، ڈرافٹس، بیک گیمن اور بہت کچھ ایک ایپ میں',
      'Шахматы, шашки, нарды и многое другое в одном приложении',
      'Шахи, шашки, нарди та інше в одному застосунку',
      'Szachy, warcaby, tryktrak i więcej w jednej aplikacji',
      'Šachy, dáma, vrhcáby a další v jedné aplikaci',
      'Șah, dame, table și multe altele într-o aplicație',
      'Sakk, dáma, ostábla és még sok más egy alkalmazásban',
      'Σκάκι, ντάμα, τάβλι και άλλα σε μία εφαρμογή',
      'Scacchi, dama, backgammon e altro in un\'unica app',
      'Xadrez, damas, gamão e mais num só app',
      'Schaken, dammen, backgammon en meer in één app',
      'Schack, dam, backgammon och mer i en app',
      'Skak, dam, backgammon og mere i én app',
      'Sjakk, dam, backgammon og mer i én app',
      'Shakki, tammi, backgammon ja paljon muuta yhdessä sovelluksessa',
      'チェス・チェッカー・バックギャモンなどをひとつのアプリに',
      '체스, 체커, 백개먼 등을 앱 하나에',
      '国际象棋、跳棋、双陆棋等，一个应用全搞定',
      'शतरंज, ड्राफ़्ट्स, बैकगैमन और भी बहुत कुछ एक ऐप में',
      'দাবা, ড্রাফটস, ব্যাকগ্যামন ও আরও অনেক কিছু এক অ্যাপে',
      'Catur, dam, backgammon, dan lainnya dalam satu aplikasi',
      'Catur, dam, backgammon dan banyak lagi dalam satu aplikasi',
      'หมากรุก หมากฮอส แบ็กแกมมอน และอื่น ๆ ในแอปเดียว',
      'Cờ vua, cờ đam, backgammon và nhiều trò khác trong một ứng dụng',
      'Chess, dama, backgammon at marami pa sa iisang app',
    ],
  seedColor: const Color(0xFF7A5230),
  icon: Icons.grid_on_rounded,
  games: [
    xoxConfig,
    dortleConfig,
    beslemeConfig,
    reversiConfig,
    hexConfig,
    noktalarConfig,
    damaConfig,
    turkDamasiConfig,
    satrancConfig,
    satrancBulmacaConfig,
    mangalaConfig,
    langirtConfig,
    karambolConfig,
    dokuzTasConfig,
    goConfig,
    tavlaConfig,
    kizmaConfig,
    yilanConfig,
    zarBesliConfig,
    farkleConfig,
    yalanciConfig,
    kapmaliConfig,
    altiliConfig,
    halmaConfig,
    cinDamasiConfig,
    alquerqueConfig,
    surakartaConfig,
    taflConfig,
    halkaConfig,
    fanoronaConfig,
    mermerConfig,
    duvarConfig,
    urConfig,
    senetConfig,
    yutConfig,
    pacisiConfig,
    amiralConfig,
    cinSatranciConfig,
    koreSatranciConfig,
    japonSatranciConfig,
    koseConfig,
    emlakConfig,
    dunyaConfig,
    yerlesimConfig,
    okeyConfig,
    okey101Config,
    dominoConfig,
    mahjongConfig,
    kaplanKeciConfig,
    gizliRutbelerConfig,
    ciniDosemeConfig,
    kartliBeslemeConfig,
    esliDominoConfig,
  ],
  starters: ['oyun-okey', 'oyun-tavla', 'oyun-langirt'],
  groups: [satrancCesitGroup, damaCesitGroup, mangalaCesitGroup, tavlaCesitGroup, okeyCesitGroup, mahjongCesitGroup],
  covers: const {
    'oyun-101-okey': GameCover('mc_101okey'),
    'oyun-alquerque': GameCover('mc_alquerque'),
    'oyun-altili-bag': GameCover('mc_altilibag'),
    'oyun-amiral-batti': GameCover('ships'),
    'oyun-besleme': GameCover('mc_besleme'),
    'oyun-cin-damasi': GameCover('mc_cindama'),
    'oyun-cin-satranci': GameCover('mc_xiangqi'),
    'oyun-dama': GameCover('checkers'),
    'oyun-dama-cesitleri': GameCover('mc_damacesit'),
    'oyun-dokuz-tas': GameCover('mc_dokuztas'),
    'oyun-domino': GameCover('domino'),
    'oyun-dortle': GameCover('connect'),
    'oyun-dunya-hakimiyeti': GameCover('map'),
    'oyun-duvar-yarisi': GameCover('mc_duvar'),
    'oyun-emlak-ticareti': GameCover('mc_emlak'),
    'oyun-fanorona': GameCover('mc_fanorona'),
    'oyun-farkle': GameCover('mc_farkle'),
    'oyun-go': GameCover('go'),
    'oyun-halka-ve-kopru': GameCover('mc_havannah'),
    'oyun-halma': GameCover('mc_halma'),
    'oyun-hex': GameCover('mc_hex'),
    'oyun-hnefatafl': GameCover('mc_hnefatafl'),
    'oyun-japon-satranci': GameCover('mc_shogi'),
    'oyun-karambol': GameCover('carromc'),
    'oyun-kapmali-besleme': GameCover('mc_kapmali'),
    'oyun-kizma-birader': GameCover('mc_kizma'),
    'oyun-kore-satranci': GameCover('mc_janggi'),
    'oyun-kose-yerlestirme': GameCover('mc_blokus'),
    'oyun-langirt': GameCover('foosball'),
    'oyun-mahjong': GameCover('mahjong'),
    'oyun-mahjong-cesitleri': GameCover('mc_mahjongcesit'),
    'oyun-mangala': GameCover('mancala'),
    'oyun-mangala-cesitleri': GameCover('mc_mangalacesit'),
    'oyun-mermer-itme': GameCover('mc_mermer'),
    'oyun-noktalar-ve-kutular': GameCover('dots'),
    'oyun-okey': GameCover('rack', label: '1,2,3,7,7'),
    'oyun-pacisi': GameCover('pacisic'),
    'oyun-okey-cesitleri': GameCover('mc_okeycesit'),
    'oyun-reversi': GameCover('reversi'),
    'oyun-satranc': GameCover('mc_satranc'),
    'oyun-satranc-bulmacalari': GameCover('mc_satrancbulmaca'),
    'oyun-satranc-cesitleri': GameCover('mc_satranccesit'),
    'oyun-senet': GameCover('mc_senet'),
    'oyun-surakarta': GameCover('mc_surakarta'),
    'oyun-tavla': GameCover('backgammon'),
    'oyun-tavla-cesitleri': GameCover('mc_tavlacesit'),
    'oyun-turk-damasi': GameCover('mc_turkdama'),
    'oyun-ur': GameCover('mc_ur'),
    'oyun-xox': GameCover('xo'),
    'oyun-yalanci-zari': GameCover('mc_yalanci'),
    'oyun-yerlesim-kurma': GameCover('mc_yerlesim'),
    'oyun-yilan-merdiven': GameCover('mc_yilan'),
    'oyun-yut': GameCover('mc_yut'),
    'oyun-zar-beslisi': GameCover('mc_zarbesli'),
    'oyun-kaplan-ve-keciler': GameCover('k4_tigergoat'),
    'oyun-gizli-rutbeler': GameCover('k4_hiddenranks'),
    'oyun-cini-doseme': GameCover('k4_cini'),
    'oyun-kartli-besleme': GameCover('k4_cardline'),
    'oyun-domino-esli': GameCover('k4_partnerdomino'),
  },
  defaultCover: const GameCover('chess'),
  sections: [
    HubSection(
        title: [
          'Strateji klasikleri',
          'Strategy classics',
          'Strategieklassiker',
          'Clásicos de estrategia',
          'Classiques de stratégie',
          'كلاسيكيات الاستراتيجية',
          'کلاسیک‌های استراتژی',
          'קלאסיקות אסטרטגיה',
          'حکمتِ عملی کے کلاسیک',
          'Стратегическая классика',
          'Стратегічна класика',
          'Klasyka strategii',
          'Strategická klasika',
          'Clasice de strategie',
          'Stratégiai klasszikusok',
          'Κλασικά στρατηγικής',
          'Classici di strategia',
          'Clássicos de estratégia',
          'Strategieklassiekers',
          'Strategiklassiker',
          'Strategiklassikere',
          'Strategiklassikere',
          'Strategiaklassikot',
          '戦略の定番',
          '전략 고전',
          '策略经典',
          'रणनीति क्लासिक',
          'কৌশলের ক্লাসিক',
          'Klasik strategi',
          'Klasik strategi',
          'กลยุทธ์คลาสสิก',
          'Kinh điển chiến thuật',
          'Klasikong estratehiya',
        ],
        ids: ['oyun-satranc', 'oyun-satranc-cesitleri', 'oyun-satranc-bulmacalari', 'oyun-dama-cesitleri', 'oyun-dama', 'oyun-turk-damasi', 'oyun-go', 'oyun-reversi', 'oyun-dokuz-tas', 'oyun-mangala', 'oyun-hnefatafl', 'oyun-alquerque', 'oyun-surakarta', 'oyun-halma', 'oyun-cin-damasi', 'oyun-fanorona', 'oyun-mermer-itme', 'oyun-duvar-yarisi', 'oyun-amiral-batti', 'oyun-cin-satranci', 'oyun-kore-satranci', 'oyun-japon-satranci', 'oyun-mangala-cesitleri', 'oyun-kaplan-ve-keciler', 'oyun-gizli-rutbeler']),
    HubSection(
        title: [
          'Çizgi ve bağlantı',
          'Lines and connections',
          'Reihen und Verbindungen',
          'Líneas y conexiones',
          'Lignes et connexions',
          'خطوط وروابط',
          'خط و اتصال',
          'קווים וחיבורים',
          'لکیریں اور جوڑ',
          'Линии и связи',
          'Лінії та зв\'язки',
          'Linie i połączenia',
          'Řady a spojení',
          'Linii și conexiuni',
          'Sorok és kapcsolatok',
          'Γραμμές και συνδέσεις',
          'Linee e collegamenti',
          'Linhas e conexões',
          'Lijnen en verbindingen',
          'Rader och förbindelser',
          'Rækker og forbindelser',
          'Rader og forbindelser',
          'Rivit ja yhteydet',
          'ならべ・つなぎ',
          '줄 잇기와 연결',
          '连线与连通',
          'पंक्ति और जोड़',
          'সারি ও সংযোগ',
          'Garis dan sambungan',
          'Garisan dan sambungan',
          'เรียงแถวและเชื่อมต่อ',
          'Xếp hàng và kết nối',
          'Linya at koneksyon',
        ],
        ids: ['oyun-xox', 'oyun-dortle', 'oyun-besleme', 'oyun-kapmali-besleme', 'oyun-altili-bag', 'oyun-hex', 'oyun-halka-ve-kopru', 'oyun-noktalar-ve-kutular', 'oyun-kose-yerlestirme', 'oyun-kartli-besleme']),
    HubSection(
        title: [
          'Zar ve yarış',
          'Dice and racing',
          'Würfel und Rennen',
          'Dados y carreras',
          'Dés et courses',
          'نرد وسباق',
          'تاس و مسابقه',
          'קוביות ומרוץ',
          'پانسہ اور دوڑ',
          'Кости и гонки',
          'Кубики й перегони',
          'Kości i wyścigi',
          'Kostky a závody',
          'Zaruri și curse',
          'Kocka és verseny',
          'Ζάρια και κούρσα',
          'Dadi e corse',
          'Dados e corrida',
          'Dobbelen en racen',
          'Tärningar och lopp',
          'Terninger og kapløb',
          'Terninger og kappløp',
          'Nopat ja kilpa',
          'ダイスとレース',
          '주사위와 경주',
          '骰子与竞速',
          'पासा और दौड़',
          'পাশা ও দৌড়',
          'Dadu dan balapan',
          'Dadu dan perlumbaan',
          'ลูกเต๋าและการแข่ง',
          'Xúc xắc và đua',
          'Dice at karera',
        ],
        ids: ['oyun-tavla', 'oyun-tavla-cesitleri', 'oyun-kizma-birader', 'oyun-yilan-merdiven', 'oyun-zar-beslisi', 'oyun-farkle', 'oyun-yalanci-zari', 'oyun-ur', 'oyun-senet', 'oyun-yut', 'oyun-pacisi', 'oyun-emlak-ticareti', 'oyun-dunya-hakimiyeti', 'oyun-yerlesim-kurma', 'oyun-cini-doseme']),
    HubSection(
        title: [
          'Taş oyunları',
          'Tile games',
          'Steinspiele',
          'Juegos de fichas',
          'Jeux de tuiles',
          'ألعاب القطع',
          'بازی‌های مهره‌ای',
          'משחקי אבנים',
          'ٹائل گیمز',
          'Игры с костями',
          'Ігри з кістками',
          'Gry z kamieniami',
          'Hry s kameny',
          'Jocuri cu pietre',
          'Kőjátékok',
          'Παιχνίδια με πλακίδια',
          'Giochi di tessere',
          'Jogos de pedras',
          'Stenenspellen',
          'Brickspel',
          'Brikspil',
          'Brikkespill',
          'Laattapelit',
          '牌のゲーム',
          '패 게임',
          '牌类游戏',
          'टाइल खेल',
          'টাইল খেলা',
          'Permainan batu',
          'Permainan batu',
          'เกมไพ่ตัวต่อ',
          'Trò chơi quân',
          'Mga larong tile',
        ],
        ids: ['oyun-okey', 'oyun-101-okey', 'oyun-domino', 'oyun-mahjong', 'oyun-okey-cesitleri', 'oyun-mahjong-cesitleri', 'oyun-domino-esli']),
    HubSection(
        title: [
          'Masa sporları',
          'Table sports',
          'Tischsport',
          'Deportes de mesa',
          'Sports de table',
          'رياضات الطاولة',
          'ورزش‌های رومیزی',
          'ספורט שולחן',
          'میز کے کھیل کود',
          'Настольный спорт',
          'Настільний спорт',
          'Sporty stołowe',
          'Stolní sporty',
          'Sporturi de masă',
          'Asztali sportok',
          'Αθλήματα τραπεζιού',
          'Sport da tavolo',
          'Esportes de mesa',
          'Tafelsporten',
          'Bordssporter',
          'Bordsport',
          'Bordsport',
          'Pöytäurheilu',
          'テーブルスポーツ',
          '테이블 스포츠',
          '桌上运动',
          'टेबल खेल',
          'টেবিল খেলাধুলা',
          'Olahraga meja',
          'Sukan meja',
          'กีฬาบนโต๊ะ',
          'Thể thao trên bàn',
          'Mga isport sa mesa',
        ],
        ids: ['oyun-langirt', 'oyun-karambol']),
  ],
);

/// Uygulama içi gizlilik politikası (Ayarlar → Gizlilik politikası). Mağaza kayıtlarında da aynı adres.
const privacyUrl = 'https://github.com/taktemurr-ops/merkez-masa-oyunlari/blob/main/PRIVACY.md';

void main() {
  registerStoreFlavor();
  bootstrapApprovedHub(hubConfig, approvedStyle, privacyUrl: privacyUrl);
}
