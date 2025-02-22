# /bin/bash

diffFile() {
echo $1 >> output.txt
awk '{print $1}' src/ENG/$1.txt > .tmp/eng.txt
awk '{print $1}' src/ESP/$1.txt > .tmp/esp.txt
sdiff -l .tmp/eng.txt .tmp/esp.txt | cat -n| grep -v -e '($' >> output.txt
rm -rf .tmp/eng.txt
rm -rf .tmp/esp.txt
echo "------------------------------------------------------" >> output.txt
}

rm -rf output.txt
touch output.txt
diffFile String
diffFile ExpansionString
diffFile PatchString