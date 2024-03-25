#!/bin/bash

echo "Mengunduh file data Genshin Impact..."
curl -o genshin_data.zip "https://drive.google.com/uc?export=download&id=1oGHdTf4_76_RacfmQIV4i7os4sGwa9vN"

echo "Mengekstrak file data Genshin Impact..."
unzip genshin_data.zip -d extracted_data

for encrypted_file in extracted_data/*; do
    decoded_name=$(echo "$encrypted_file" | base64 -d)
    mv "$encrypted_file" "${encrypted_file%/*}/$decoded_name"
done

while IFS=',' read -r region name element weapon; do
    mkdir -p "extracted_data/$region"
    matched_file=$(find "extracted_data/" -type f -name "$name")
    if [ -f "$matched_file" ]; then
        extension="${matched_file##*.}"
        new_name="$region - $name - $element - $weapon.$extension"
        mv "$matched_file" "extracted_data/$region/$new_name"
    fi
done < karakter_list.csv
