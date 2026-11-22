import 'package:flutter/material.dart';
import 'package:oyun_alquerque/oyun_alquerque.dart';
import 'package:oyun_altili_bag/oyun_altili_bag.dart';
import 'package:oyun_besleme/oyun_besleme.dart';
import 'package:oyun_cin_damasi/oyun_cin_damasi.dart';
import 'package:oyun_dama/oyun_dama.dart';
import 'package:oyun_dama_cesitleri/oyun_dama_cesitleri.dart';
import 'package:oyun_dokuz_tas/oyun_dokuz_tas.dart';
import 'package:oyun_dortle/oyun_dortle.dart';
import 'package:oyun_farkle/oyun_farkle.dart';
import 'package:oyun_go/oyun_go.dart';
import 'package:oyun_halka_ve_kopru/oyun_halka_ve_kopru.dart';
import 'package:oyun_halma/oyun_halma.dart';
import 'package:oyun_hex/oyun_hex.dart';
import 'package:oyun_hnefatafl/oyun_hnefatafl.dart';
import 'package:oyun_kapmali_besleme/oyun_kapmali_besleme.dart';
import 'package:oyun_kizma_birader/oyun_kizma_birader.dart';
import 'package:oyun_mangala/oyun_mangala.dart';
import 'package:oyun_mangala_cesitleri/oyun_mangala_cesitleri.dart';
import 'package:oyun_noktalar_ve_kutular/oyun_noktalar_ve_kutular.dart';
import 'package:oyun_reversi/oyun_reversi.dart';
import 'package:oyun_satranc/oyun_satranc.dart';
import 'package:oyun_satranc_cesitleri/oyun_satranc_cesitleri.dart';
import 'package:oyun_surakarta/oyun_surakarta.dart';
import 'package:oyun_tavla/oyun_tavla.dart';
import 'package:oyun_tavla_cesitleri/oyun_tavla_cesitleri.dart';
import 'package:oyun_turk_damasi/oyun_turk_damasi.dart';
import 'package:oyun_xox/oyun_xox.dart';
import 'package:oyun_yalanci_zari/oyun_yalanci_zari.dart';
import 'package:oyun_yilan_merdiven/oyun_yilan_merdiven.dart';
import 'package:oyun_zar_beslisi/oyun_zar_beslisi.dart';
import 'package:studio_core/app/hub.dart';

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
    mangalaConfig,
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
  ],
  groups: [satrancCesitGroup, damaCesitGroup, mangalaCesitGroup, tavlaCesitGroup],
);

void main() => bootstrapHub(hubConfig);
