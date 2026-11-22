import 'dart:convert';
import 'dart:io';

import 'package:integration_test/integration_test_driver.dart';

/// Testin çizdiği mağaza görsellerini shots/raw altına yazar.
Future<void> main() => integrationDriver(
      responseDataCallback: (Map<String, dynamic>? data) async {
        final shots = (data?['shots'] as Map?) ?? const {};
        for (final e in shots.entries) {
          final f = File('shots/raw/${e.key}.png');
          f.createSync(recursive: true);
          f.writeAsBytesSync(base64Decode(e.value as String));
        }
        stdout.writeln('kaydedilen görsel: ${shots.length}');
      },
    );
