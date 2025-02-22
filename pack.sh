# /bin/bash

rm -rf .tmp
mkdir .tmp
rm -rf dest
mkdir dest

collectOutput() {
mv d2tbl_ouput.tbl .tmp/$1.tbl
}

#unix2dos src/ESP/String.txt
tools/d2tbl.exe -import src/ESP/String.txt -ansi -always-insert
collectOutput String
#unix2dos src/ESP/PatchString.txt
tools/d2tbl.exe -import src/ESP/PatchString.txt -ansi -always-insert
collectOutput PatchString
#unix2dos src/ESP/ExpansionString.txt
tools/d2tbl.exe -import src/ESP/ExpansionString.txt -ansi -always-insert
collectOutput ExpansionString

cp origin/lang-es.mpq .tmp

tools/MPQEditor.exe delete .tmp/lang-es.mpq "data\local\lng\esp\String.tbl"
tools/MPQEditor.exe delete .tmp/lang-es.mpq "data\local\lng\esp\PatchString.tbl"
tools/MPQEditor.exe delete .tmp/lang-es.mpq "data\local\lng\esp\ExpansionString.tbl"
tools/MPQEditor.exe add .tmp/lang-es.mpq ".tmp/*.tbl" "data\local\lng\esp" /auto

mv .tmp/lang-es.mpq dest