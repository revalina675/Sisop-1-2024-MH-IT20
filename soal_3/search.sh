#!/bin/bash
# membuat fungsi untuk mencatat log
log() {
    echo "[$(date "+%d/%m/%Y %H:%M:%S")] [$1] [$2]"
}
# directory untuk save gambar
image_dir="gambar"
# directory untuk save file txt
txt_dir="teks"

# memastikan adanya directory gambar dan text, jika belum ada maka akan dibuat
mkdir -p "$image_dir"
mkdir -p "$txt_dir"
# program melakukan looping
while true; do
    # Loop berjalan pada setiap file gambar dalam directory gambar
    for image in "$image_dir"/*; do
        # cek kondisi apakah file tersebut merupakan gambar
        if [ -f "$image" ]; then
            # extract value gambar dengan steghide
            value=$(steghide extract -sf "$image" -p '' 2>/dev/null | grep "value:" | awk '{print $2}')
            if [ -n "$value" ]; then
                # hasil extract di save dalam bentuk txt
                echo "$value" > "$txt_dir/$(basename "$image").txt"
                log "FOUND" "$image"
                exit
            else
                log "NOT FOUND" "$image"
            fi
        fi
    done
    # program akan menunggu tiap 1 detik untuk cek kembali
    sleep 1
done
