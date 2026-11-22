#!/usr/bin/env bash
# Mağaza görsellerini dil gruplarıyla çeker (her çalıştırmada birkaç dil,
# böylece cihazdan gelen veri küçük kalır).
set -e
LANGS="${1:-tr,en,de,es,fr,ar,fa,he,ur,ru,uk,pl,cs,ro,hu,el,it,pt,nl,sv,da,nb,fi,ja,ko,zh,hi,bn,id,ms,th,vi,fil}"
IFS=',' read -ra ALL <<< "$LANGS"
for ((i = 0; i < ${#ALL[@]}; i += 3)); do
  CHUNK=$(IFS=','; echo "${ALL[*]:i:3}")
  echo "== $CHUNK"
  flutter drive --driver=test_driver/integration_test.dart --target=integration_test/store_shots_test.dart --dart-define=LANGS="$CHUNK" -d emulator-5554
done
ls shots/raw | wc -l
