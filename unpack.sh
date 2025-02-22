# /bin/bash

rm -rf .tmp
mkdir .tmp .tmp/ESP .tmp/ENG

tools/MPQEditor.exe extract origin/lang-es.mpq "data\local\LNG\ESP\*.tbl" .tmp/ESP
tools/MPQEditor.exe extract origin/medianxl-YmludGJsdHh0.mpq  "data\local\LNG\ENG\*.tbl" .tmp/ENG
tools/d2tbl.exe -export .tmp/ESP/String.tbl -o src/ESP/String.txt
tools/d2tbl.exe -export .tmp/ESP/PatchString.tbl -o src/ESP/PatchString.txt
tools/d2tbl.exe -export .tmp/ESP/ExpansionString.tbl -o src/ESP/ExpansionString.txt
tools/d2tbl.exe -export .tmp/ENG/string.tbl -o src/ENG/String.txt
tools/d2tbl.exe -export .tmp/ENG/patchstring.tbl -o src/ENG/PatchString.txt
tools/d2tbl.exe -export .tmp/ENG/expansionstring.tbl -o src/ENG/ExpansionString.txt