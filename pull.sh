#!/bin/bash

# Check if tag argument is provided
if [ -z "$1" ]
    then
        echo "Please provide a tag string as an argument"
        exit 1
fi

# Check if type argument is provided
if [ -z "$2" ]
    then
        echo "Please provide a type string as an argument"
        exit 1
fi


# Construct download URL
tag=$1
type=$2

mxlurl="https://get.median-xl.com/get.php?type=mxl_$type&tag=$tag&file=medianxl-YmludGJsdHh0.mpq"
langurl="https://github.com/razo2020/MedianXL-LNG/releases/download/v2.10.5_0.1/Release.zip"
tmp=".tmp"

# Download files
echo "Downloading $mxlurl"
curl -L -o "$tmp/MXL_LNG.mpq" $mxlurl
echo "Downloading $langurl"
curl -L -o "$tmp/Release.zip" "$langurl"
echo "Extracting..."
unzip -o "$tmp/Release.zip" -d "$tmp"

# Move files to origin directory
mkdir -p origin
mv "$tmp/MXL_LNG.mpq" "$tmp/lang-es.mpq" origin/
echo "Files moved to origin directory"