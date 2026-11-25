import 'package:flutter/material.dart';
import 'package:studio_core/app/approved_hub.dart';

/// Onaylı tasarım (Oyun Merkezleri · Tasarım Örnekleri).
const approvedStyle = ApprovedHubStyle(
  background: [Color(0xFF0F5A2E), Color(0xFF0A3D22), Color(0xFF062414)],
  accent: Color(0xFF5BE36A),
  card: Color(0xFF14703A),
  play: Color(0xFF3CC24E),
  number: Color(0xFFFFC93C),
  heroAsset: 'assets/approved/hero.png',
  blocks: [ApprovedBlock.chips, ApprovedBlock.featured, ApprovedBlock.weeklyQuest],
  featuredKey: 'featured',
  featured: ['oyun-satranc', 'oyun-dama', 'oyun-tavla'],
  tileArt: {
    'oyun-satranc': 'assets/approved/tile_satranc.png',
    'oyun-dama': 'assets/approved/tile_dama.png',
    'oyun-tavla': 'assets/approved/tile_tavla.png',
  },
);
