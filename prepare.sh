# /bin/bash

ongoing_str="## ongoing"
patch_str="x	MedianXL: Sigma {{game}} https://www.median-xl.com/changelog ver. Español: {{patch}}\r"

sed -i "3i\\$ongoing_str\n" CHANGELOG.md
sed -i "1883c\\$patch_str" src/ESP/ExpansionString.txt