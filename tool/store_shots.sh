#!/usr/bin/env bash
# Mağaza görsellerini dil gruplarıyla çeker. Test görselleri uygulamanın
# geçici klasörüne yazar; her gruptan sonra adb ile shots/raw altına alınır.
set -e
PKG=com.gamestudio100.merkez_masa_oyunlari
LANGS="${1:-tr,en,de,es,fr,ar,fa,he,ur,ru,uk,pl,cs,ro,hu,el,it,pt,nl,sv,da,nb,fi,ja,ko,zh,hi,bn,id,ms,th,vi,fil}"
IFS=',' read -ra ALL <<< "$LANGS"
mkdir -p shots/raw
for ((i = 0; i < ${#ALL[@]}; i += 6)); do
  CHUNK=$(IFS=','; echo "${ALL[*]:i:6}")
  echo "== $CHUNK"
  flutter drive --keep-app-running --driver=test_driver/integration_test.dart --target=integration_test/store_shots_test.dart --dart-define=LANGS="$CHUNK" -d emulator-5554
  adb exec-out run-as $PKG sh -c 'cd "$(find . -type d -name shots | head -1)" && tar cf - .' > /tmp/shots.tar
  tar xf /tmp/shots.tar -C shots/raw
  adb shell run-as $PKG sh -c 'rm -rf "$(find . -type d -name shots | head -1)"'
  ls shots/raw | wc -l
done
