# PRAKTIKUM MODUL 01 SISTEM OPERASI
## Kelompok IT20
### Anggota Kelompok :
|             Nama              |     NRP    |
|-------------------------------|------------|
| Revalina Fairuzy Azhari Putri | 5027231001 |
| Farida Qurrotu 'Ayuna         | 5027231015 |
| Gallant Damas Hayuaji         | 5027231037 |

### Soal 1
Cipung dan abe ingin mendirikan sebuah toko bernama “SandBox”, sedangkan kamu adalah manajer penjualan yang ditunjuk oleh Cipung dan Abe untuk melakukan pelaporan penjualan dan strategi penjualan kedepannya yang akan dilakukan.

Setiap tahun Cipung dan Abe akan mengadakan rapat dengan kamu untuk mengetahui laporan dan strategi penjualan dari “SandBox”. Buatlah beberapa kesimpulan dari data penjualan “Sandbox.csv” untuk diberikan ke cipung dan abe 

a. Karena Cipung dan Abe baik hati, mereka ingin memberikan hadiah kepada customer yang telah belanja banyak. Tampilkan nama pembeli dengan total sales paling tinggi

b. Karena karena Cipung dan Abe ingin mengefisienkan penjualannya, mereka ingin merencanakan strategi penjualan untuk customer segment yang memiliki profit paling kecil. Tampilkan customer segment yang memiliki profit paling kecil

c. Cipung dan Abe hanya akan membeli stok barang yang menghasilkan profit paling tinggi agar efisien. Tampilkan 3 category yang memiliki total profit paling tinggi 

d. Karena ada seseorang yang lapor kepada Cipung dan Abe bahwa pesanannya tidak kunjung sampai, maka mereka ingin mengecek apakah pesanan itu ada. Cari purchase date dan amount (quantity) dari nama adriaens

*penyelesaian*

- Buat sebuah folder dengan command berikut :

*disini saya membuat folder dengan nama sandbox*

```bash
mkdir sandbox
```

`mkdir` command untuk membuat directory

`sandbox` nama directory yang ingin dibuat

- Masuk ke dalam folder SandBox
```bash
cd sandbox
```

`cd` command untuk masuk ke dalam suatu directory

- menginstall file yang diminta oleh soal
```bash
wget -O Sandbox.csv 'https://drive.google.com/uc?download=export&id=1cC6MYBI3wRwDgqlFQE1OQUN83JAreId0'
```

- Mengubah file menjadi executable
```bash
chmod +x Sandbox.csv
```

- mengecek apakah file benar-benar sudah terdownload dan aktif
```bash
ls -l Sandbox.csv
```

![gambar 1](https://github.com/revalina675/Sisop-1-2024-MH-IT20/assets/150933246/4f77788c-b0e8-4b49-999b-68bfd826f671)

- buat konfigurasi sandbox.sh sesuai yang diminta soal
```bash
nano sandbox.sh
```

- Masukkan konfigurasi untuk tiap sub soal yang ada
```bash
#subsoal a mencari sales paling tinggi beserta memunculkan nama pembeli
awk -F ',' 'NR>1{if(max=="") { max=$17; cust=$6; } else if($17>max) { max=$17; cust=$6; }} END{print cust}' Sandbox.csv

#subsoal b menampilkan pelanggan dengan segment yang memiliki profit paling kecil
awk -F ',' 'NR>1{if(min=="") { min=$20; segment=$7; } else if($20<min) { min=$20; segment=$7; }} END{print segment}' Sandbox.csv 

#subsoal c menampilkan 3 kategori dengan penghasilan total profit paling tinggi
awk -F ',' 'NR > 1 {profit[$14] += $20} END {for (category in profit) print category}' Sandbox.csv | sort -k2 -nr | head -n3

#subsoal d
grep -i "Adriaens .*" Sandbox.csv | awk -F ',' '{print "tanggal pembelian: " $2; print "banyak: " $18}'
```

**penjelasan subsoal a**

`awk -F ','` command yang digunakan untuk membaca baris dan memisah tiap bagian yang ada pada abris dengan ','

`NR>1` command yang digunakan untuk mengeksekusi tiap baris setelah header

`if(max=="") { max=$17; cust=$6; }` fungsi yang digunakan untuk menginisiasi nilai maksimal ada pada baris pertama kolom 17, dan letak nama pembeli ada pada baris pertama kolom 6

`else if($17>max) { max=$17; cust=$6; }` fungsi yang digunakan untuk mengganti nilai maksimal hingga tidak ada nilai yang lebih besar lagi diatasnya

`END{print cust}'` output yang akan ditampilkan adalah nama pembeli/customer

**penjelasan subsoal b**

`awk -F ','` command yang digunakan untuk membaca baris dan memisah tiap bagian yang ada pada abris dengan ','

`NR>1` command yang digunakan untuk mengeksekusi tiap baris setelah header

`if(min=="") { min=$20; segment=$7; }` fungsi yang digunakan untuk menginisiasi nilai mainimal ada pada baris pertama kolom 20, dan letak nama pembeli ada pada baris pertama kolom 7

`else if($20<min) { min=$20; segment=$7; }}` fungsi yang digunakan untuk mengganti nilai minimum hingga tidak ada nilai yang lebih kecil lagi dibawahnya

`END{print segment}'` output yang akan ditampilkan adalah nama segment

**penjelasan subsoal c**

`awk -F ','` command yang digunakan untuk membaca baris dan memisah tiap bagian yang ada pada abris dengan ','

`NR>1` command yang digunakan untuk mengeksekusi tiap baris setelah header

`{profit[$14] += $20}` fungsi yang digunakan untuk menginisiasi nilai profit paling tinggi, serta menunjukkan bahwa section kategori ada pada kolom 14 dan profit pada kolom 20

`ND {for (category in profit) print category}'` output yang akan ditampilkan adalah 3 nama kategori yang memiliki profil paling tinggi

`| sort -k2 -nr` total profit akan diurutkan secara descending

`| head -n3` hasil pengurutan akan diambil 3 baris pertama yang merupakan profil tertinggi

**penjelasan subsoal d**

`grep -i "Adriaens ." Sandbox.csv` mencari baris-baris dalam file Sandbox.sh yang mengandung kata Adriaens

`| awk -F ',' '{print "tanggal pembelian: " $2; print "banyak: " $18}` command yang menunjukkan bahwa kolom tanggal pembelian/purchase date milik Adriaens akan dicari pada kolom 2, sedangkan untuk banyak/quantity akan dicari pada kolom 18

![gambar 2](https://github.com/revalina675/Sisop-1-2024-MH-IT20/assets/150933246/e27761a0-ba3c-4312-84c4-9d15cd3999e0)

- Mengubah konfigurasi agar menjadi executable
```bash
chmod +x sandbox.csv
```

- Menjalankan file scirpt bash
```bash
./sandbox.sh
```

- hasil output
  
![gambar 3](https://github.com/revalina675/Sisop-1-2024-MH-IT20/assets/150933246/eee58f07-6ab5-4b5b-b6d8-a118f1fb796c)

*revisi*
Pada code awal saya menggunakan 
```bash
grep -i "Adriaens .*" Sandbox.csv 
awk -F ',' '{print "purchase date: " $2}'

grep -i "Adriaens .*" Sandbox.csv
awk -F ',' '{print "quantity: " $18}'
```
Namun, code ini tidak bisa berjalan. Akhirnya saya mencoba menggunakan code baru yang tidak terpisah seperti code awal, menjadi
```bash
grep -i "Adriaens .*" Sandbox.csv | awk -F ',' '{print "tanggal pembelian: " $2; print "banyak: " $18}'
```
Hingga akhirnya, program dapat dijalankan.

### Soal 2

Oppie merupakan seorang peneliti bom atom, ia ingin merekrut banyak peneliti lain untuk mengerjakan proyek bom atom nya, Oppie memiliki racikan bom atom rahasia yang hanya bisa diakses penelitinya yang akan diidentifikasi sebagai user, Oppie juga memiliki admin yang bertugas untuk memanajemen peneliti,  bantulah oppie untuk membuat program yang akan memudahkan tugasnya 

  a. Buatlah 2 program yaitu login.sh dan register.sh
  
  b. Setiap admin maupun user harus melakukan register terlebih dahulu menggunakan email, username, pertanyaan keamanan dan jawaban, dan password
  
  c. Username yang dibuat bebas, namun email bersifat unique **setiap email yang mengandung kata admin akan dikategorikan menjadi admin** 
  
  d. Karena resep bom atom ini sangat rahasia Oppie ingin password nya memuat keamanan tingkat tinggi
      a) Password tersebut harus di encrypt menggunakan base64
      b) Password yang dibuat harus lebih dari 8 karakter
      c) Harus terdapat paling sedikit 1 huruf kapital dan 1 huruf kecil
      d) Harus terdapat paling sedikit 1 angka 
  
  e. Karena Oppie akan memiliki banyak peneliti dan admin ia berniat untuk menyimpan seluruh data register yang ia lakukan ke dalam folder users file users.txt. Di dalam file tersebut, terdapat catatan seluruh email, username, pertanyaan keamanan dan jawaban, dan password hash yang telah ia buat.
  
  f. Setelah melakukan register, program harus bisa melakukan login. Login hanya perlu dilakukan menggunakan email dan password.
  
  g. Karena peneliti yang di rekrut oleh Oppie banyak yang sudah tua dan pelupa maka Oppie ingin ketika login akan ada pilihan lupa password dan akan keluar pertanyaan keamanan dan ketika dijawab dengan benar bisa memunculkan password
  
  h. Setelah user melakukan login akan keluar pesan sukses, namun setelah seorang admin melakukan login Oppie ingin agar admin bisa menambah, mengedit (username, pertanyaan keamanan dan jawaban, dan password), dan menghapus user untuk memudahkan kerjanya sebagai admin. 
  
  i. Ketika admin ingin melakukan edit atau hapus user, maka akan keluar input email untuk identifikasi user yang akan di hapus atau di edit
  
  j. Oppie ingin programnya tercatat dengan baik, maka buatlah agar program bisa mencatat seluruh log ke dalam folder users file auth.log, baik login ataupun register.
  
  a) Format: [date] [type] [message]
  
  b) Type: REGISTER SUCCESS, REGISTER FAILED, LOGIN SUCCESS, LOGIN FAILED
  
  c) Ex:
            
  i. [23/09/17 13:18:02] [REGISTER SUCCESS] user [username] registered successfully
  
  ii. [23/09/17 13:22:41] [LOGIN FAILED] ERROR Failed login attempt on user with email [email]

*PENYELESAIAN*

## soal 2a

Pada soal ini diperintahkan untuk membuat dua program yaitu register.sh dan login.sh

![Gambar Contoh](https://github.com/Faridaqurr/lapres/blob/main/9ced4635ed159aa08306a03c8575e9a5.jpg)

`mkdir praktikum1` untuk membuat folder praktikum

`cd praktikum` untuk pindah ke directory praktikum sebelum membuat file

`nano register.sh` untuk membuat konfigurasi program register.sh

`bash register.sh` untuk menjalankan konfigurasi register.sh

`nano login.sh` untuk membuat konfigurasi program login.sh

`bash login.sh` untuk menjalankan konfigurasi login.sh

## soal 2b

Ketika penyelesaian soal, pada program register harus menampilkan email, username, pernyataan keamanan dan jawaban, serta password

    read -p "Email		  : " email
    read -p "Username	  : " username
    read -p "Security Question : " security_question
    read -p "Security Answer   : " security_answer
    read -sp "Password	  : " password
    echo
    
## soal 2c

Saat memasukkan data, program dibuat agar ketika terdeteksi kata "admin" pada email maka secara otomatis user tersebut akan dikategorikan sebagai admin

      	if [[ $user_type == "admin" ]]; then
      		echo "[ $(date +'%d%m%Y %H:%M:%S') ] [REGISTER SUCCESS] Admin $username berhasil registrasi." >> auth.log
      		echo "Admin $username berhasil regitrasi"
      	else
      		echo "[ $(date +'%d%m%Y %H:%M:%S') ] [REGISTER SUCCESS] User $username berhasil regitrasi." >> auth.log
      		echo "User $username berhasil registrasi"
      	fi

`[[ $user_type == "admin" ]]` untuk mendeteksi kata admin, sehingga akan otomatis user_type nya menjadi admin 

`>> auth.log` untuk memasukkan spesifikasi data yang masuk untuk ditampung di auth.log

## soal 2d

Dalam pembuatan password juga diminta untuk memenuhi beberapa kriteria password seperti jumlah password minimal 8 dan minimal mengandung 1 huruf kapital dan juga angka, serta untuk enkripsinya menggunakan base64

=> fungsi untuk enkripsi pasword menggunakan base64
   
    encrypt_password()
    {
    	echo -n "$1" | base64
    }

`-n "$1"` untuk menampilkan teks (password) tanpa menambahkan newline

=> fungsi untuk ketentuan password
       
    if [[ ${#password} -lt  8 || !("$password" =~ [[:lower:]]) || !("$password" =~ [[:upper:]]) || !("$password" =~ [0-9]) ]]; then
        echo -e  "!Password harus berjumlah 8 karakter atau lebih!\n!Tambahkan minimal 1 huruf kapital dan angka!"
        read -sp "Password: " password
        echo
    else
    		break
    fi

`-lt  8` untuk cek jumlah password kurang dari 8 atau tidak

`[[:lower:]]` untuk cek apakah mengandung huruf kecil

`[[:upper:]]` untuk cek apakah mengandung huruf kapital

`[0-9]` untuk cek apakah mengandung angka

## soal 2e

Semua data yang telah diinputkan akan disimpan dalam file users.txt

    echo "$email:$usename:$security_question:$security_answer:$encrypted_password:$user_type" >> users.txt

`>> users.txt` untuk menyimpan semua data yang diinputkan ke users.txt

## soal 2f

Setelah melakukan register, terdapat juga program untuk login yang cukup menampilkan email dan password

    echo "~USER LOGIN~"
    echo "1. Login"
    echo "2. Forgot Password"
    read -p "Choose an option: " option

## soal 2g

Dalam program login, harus menampilkan opsi lupa password dan ketika memilih opsi tersebut akan ditampilkan pertanyaan keamanan dan pengguna harus memasukkan jawaban dari pertanyaan keamanan tersebut agar password ditampilkan

    #case untuk forget password
    2) 
                read -p "Enter your email: " email
                reset_password "$email"
                ;;
        reset_password() 
        {
          local email=$1

`email` untuk menyimpan inputan ke alamat email

`reset_password $email` untuk memanggil fungsi alamat reset password dengan email sebagai argumen tambahannya

    #fungsi untuk reset password
    if check_registered_email "$email"; then
        security_question=$(grep "^$email" users.txt | cut -d':' -f3)
        echo "Security question: $security_question"
        read -p "Enter your answer: " security_answer

        stored_security_answer=$(grep "^$email" users.txt | cut -d':' -f4)

        if [ "$security_answer" == "$stored_security_answer" ]; then
            encrypted_password=$(grep "^$email" users.txt | cut -d':' -f5)
            decrypted_password=$(decode_base64 "$encrypted_password")
            echo "Your password is: $decrypted_password"
            echo "[ $(date +'%d/%m/%Y %H:%M:%S') ] [PASSWORD RESET] Password reset requested for user with email $email." >> auth.log
        else
            echo "Incorrect security answer. Password reset failed."
            echo "[ $(date +'%d/%m/%Y %H:%M:%S') ] [PASSWORD RESET FAILED] ERROR: Incorrect security answer for user with email $email." >> auth.log
        fi
    else
        echo "Email not found. Please register first."
        echo "[ $(date +'%d/%m/%Y %H:%M:%S') ] [PASSWORD RESET FAILED] ERROR: User with email $email not found." >> auth.log
    fi
    }

`grep` untuk mengambil alamat email di dalam users.txt

`cut -d':' -f3` untuk memilih kolom ke 3 dari file users.txt yang menunjukkan data security question

`>> auth.log` untuk memasukkan spesifikasi data yang masuk untuk ditampung di auth.log

## soal 2h

Jika login berhasil maka akan di tampilkan pesan sukse, namun jika terdeteksi seorang admin yang login maka akan muncul output tambahan yaitu admin menu yang berisikan add user, edit user, delete user, dan logout untuk memudahkan pkerjaan admin

     # case untuk login admin
     1)
            read -p "Email: " email
            read -sp "Password: " password
            echo
            if authenticate_user "$email" "$password"; then
                if [[ $email == *admin* ]]; then
                    echo "Welcome, Admin!"
                    echo "Admin menu:"
                    echo "1. Add user"
                    echo "2. Edit user"
                    echo "3. Delete user"
                    echo "4. Logout"
                    read -p "Enter your choice: " choice
    
                    case $choice in
                        1)
                            add_user
                            ;;
                        2)
                            read -p "Enter email of the user to edit: " edit_email
                            edit_user "$edit_email"
                            ;;
                        3)
                            read -p "Enter email of the user to delete: " delete_email
                            delete_user "$delete_email"
                            ;;
                        4)
                            echo "Logout successful"
                            ;;
                        *)
                            echo "Invalid choice"
                            ;;
                    esac
                else
                    echo "Login successful."
                fi
            fi
            ;;

`*admin*` untuk konfirmasi masukan yang terdapat kata adminnya

`edit_email` untuk memanggil fungsi edit_email

`delete_email` untuk memanggil fungsi delete_email

## soal 2i

Ketika memilih menu admin edit dan delete user, maka akan memunculkan tampilan untuk inputan email atau username

    # Fungsi untuk mengedit
    edit_user() 
    {
        local email=$1
        read -p "Enter new username: " new_username
        read -p "Enter new security question: " new_security_question
        read -p "Enter new security answer: " new_security_answer
        read -sp "Enter new password: " new_password
        echo
    
        # Update user dan dimasukkan ke  users.txt
        sed -i "s/^$email:.*/$email:$new_username:$new_security_question:$new_security_answer:$(echo -n $new_password | base64):user/g" users.txt
    
        echo "User $email updated successfully."
        echo "[ $(date +'%d/%m/%Y %H:%M:%S') ] [USER EDIT] User with email $email edited successfully." >> auth.log
    }

`local email=$1` untuk memanggil fungsi local email pada register.sh

`>> auth.log` untuk memasukkan spesifikasi data yang masuk untuk ditampung di auth.log

    # Fungsi untuk menghapus user
    delete_user() 
    {
        local email=$1
    
    #hapus user dari users.txt
        sed -i "/^$email:/d" users.txt
        echo "User $email deleted successfully"
        echo "[ $(date +'%d/%m/%Y %H:%M:%S') ] [USER DELETE] User with email $email deleted successfully" >> auth.log
    }

`local email=$1` untuk memanggil fungsi local email pada register.sh

`-i` untuk melakukan perubahan (delete) langsung

`"/^$email:/d"` untuk menghapus seluruh data dari alamat email yang ditentukan

`users.txt` untuk melakukan perubahan (delete) langsung di dalam users.txt

## soal 2j

Seluruh data log yang diinputkan akan disimpan ke dalam auth.log baik login maupun register, dengan format [DATE][TYPE][MASSAGE]

![Gambar Contoh](https://github.com/Faridaqurr/lapres/blob/main/9ced4635ed159aa08306a03c8575e9a5.jpg)


### Soal 3
Alyss adalah seorang gamer yang sangat menyukai bermain game Genshin Impact. Karena hobinya, dia ingin mengoleksi foto-foto karakter Genshin Impact. Suatu saat Yanuar memberikannya sebuah Link yang berisi koleksi kumpulan foto karakter dan sebuah clue yang mengarah ke penemuan gambar rahasia. Ternyata setiap nama file telah dienkripsi dengan menggunakan hexadecimal. Karena penasaran dengan apa yang dikatakan Yanuar, Alyss tidak menyerah dan mencoba untuk mengembalikan nama file tersebut kembali seperti semula.

A. Alyss membuat script bernama awal.sh, untuk download file yang diberikan oleh Yanuar dan unzip terhadap file yang telah diunduh dan decode setiap nama file yang terenkripsi dengan hex . Karena pada file list_character.csv terdapat data lengkap karakter, Alyss ingin merename setiap file berdasarkan file tersebut. Agar semakin rapi, Alyss mengumpulkan setiap file ke dalam folder berdasarkan region tiap karakter
  i. Format: Region - Nama - Elemen - Senjata.jpg
  
B. Karena tidak mengetahui jumlah pengguna dari tiap senjata yang ada di folder "genshin_character".Alyss berniat untuk menghitung serta menampilkan jumlah pengguna untuk setiap senjata yang ada
  i. Format: [Nama Senjata] : [jumlah]
  
C. Untuk menghemat penyimpanan. Alyss menghapus file - file yang tidak ia gunakan, yaitu genshin_character.zip, list_character.csv, dan genshin.zip
Namun sampai titik ini Alyss masih belum menemukan clue dari the secret picture yang disinggung oleh Yanuar. Dia berpikir keras untuk menemukan pesan tersembunyi tersebut. Alyss membuat script baru bernama search.sh untuk melakukan pengecekan terhadap setiap file tiap 1 detik. Pengecekan dilakukan dengan cara meng-ekstrak sebuah value dari setiap gambar dengan menggunakan command steghide. Dalam setiap gambar tersebut, terdapat sebuah file txt yang berisi string. Alyss kemudian mulai melakukan dekripsi dengan hex pada tiap file txt dan mendapatkan sebuah url. Setelah mendapatkan url yang ia cari, Alyss akan langsung menghentikan program search.sh serta mendownload file berdasarkan url yang didapatkan.

D. Dalam prosesnya, setiap kali Alyss melakukan ekstraksi dan ternyata hasil ekstraksi bukan yang ia inginkan, maka ia akan langsung menghapus file txt tersebut. Namun, jika itu merupakan file txt yang dicari, maka ia akan menyimpan hasil dekripsi-nya bukan hasil ekstraksi. Selain itu juga, Alyss melakukan pencatatan log pada file image.log untuk setiap pengecekan gambar
  i. Format: [date] [type] [image_path]
  ii. Ex: 
          1. [24/03/20 17:18:19] [NOT FOUND] [image_path]
          2. [24/03/20 17:18:20] [FOUND] [image_path]
          
E. Hasil akhir:
          - genshin_character
          - search.sh
          - awal.sh
          - image.log
          - [filename].txt
          - [image].jpg

_Penyelesaian_

- Buat suatu directory
_disini saya menggunakan directory genshin_
```bash
mkdir genshin
```

- Masuk ke dalam directory tersebut
```bash
cd genshin
```

- download file yang diperintahkan soal
```bash
wget -O genshin.zip 'https://drive.google.com/uc?download=export&id=1oGHdTf4_76_RacfmQIV4i7os4sGwa9vN'
```

- unzip file yang masih dalam mode .zip
```bash
unzip genshin.zip
unzip genshin_character.zip
```

- masuk ke dalam genshin_character
```bash
cd genshin_character
```

- decrypted file
```bash
for encrypted_file in *.jpg; do
    decrypted_filename=$(echo "$encrypted_file" | xxd -r -p)
    mv "$encrypted_file" "$decrypted_filename"
done
```


### Soal 4
Stitch sangat senang dengan PC di rumahnya. Suatu hari, PC nya secara tiba-tiba nge-freeze 🤯 Tentu saja, Stitch adalah seorang streamer yang harus setiap hari harus bermain game dan streaming.  Akhirnya, dia membawa PC nya ke tukang servis untuk diperbaiki. Setelah selesai diperbaiki, ternyata biaya perbaikan sangat mahal sehingga dia harus menggunakan uang hasil tabungan nya untuk membayarnya. Menurut tukang servis, masalahnya adalah pada CPU dan GPU yang overload karena gaming dan streaming sehingga mengakibatkan freeze pada PC nya. Agar masalah ini tidak terulang kembali, Stitch meminta kamu untuk membuat sebuah program monitoring resource yang tersedia pada komputer.

Buatlah program monitoring resource pada PC kalian. Cukup monitoring ram dan monitoring size suatu directory. Untuk ram gunakan command `free -m`. Untuk disk gunakan command `du -sh <target_path>`. Catat semua metrics yang didapatkan dari hasil `free -m`. Untuk hasil `du -sh <target_path>` catat size dari path directory tersebut. Untuk target_path yang akan dimonitor adalah /home/{user}/. 

a.	Masukkan semua metrics ke dalam suatu file log bernama `metrics_{YmdHms}.log`. {YmdHms} adalah waktu disaat file script bash kalian dijalankan. Misal dijalankan pada 2024-03-20 15:00:00, maka file log yang akan tergenerate adalah `metrics_20240320150000.log`. 

b.	Script untuk mencatat metrics diatas diharapkan dapat berjalan otomatis pada setiap menit. 

c.	Kemudian, buat satu script untuk membuat agregasi file log ke satuan jam. Script agregasi akan memiliki info dari file-file yang tergenerate tiap menit. Dalam hasil file agregasi tersebut, terdapat nilai minimum, maximum, dan rata-rata dari tiap-tiap metrics. File agregasi akan ditrigger untuk dijalankan setiap jam secara otomatis. Berikut contoh nama file hasil agregasi `metrics_agg_2024032015.log` dengan format `metrics_agg_{YmdH}.log` 

d.	Karena file log bersifat sensitif pastikan semua file log hanya dapat dibaca oleh user pemilik file. 

Note:
-	Nama file untuk script per menit adalah minute_log.sh
-	Nama file untuk script agregasi per jam adalah aggregate_minutes_to_hourly_log.sh
-	Semua file log terletak di /home/{user}/log
-	Semua konfigurasi cron dapat ditaruh di file skrip .sh nya masing-masing dalam bentuk comment

-	Nama file untuk script per menit adalah minute_log.sh
-	Nama file untuk script agregasi per jam adalah aggregate_minutes_to_hourly_log.sh
-	Semua file log terletak di /home/{user}/log
-	Semua konfigurasi cron dapat ditaruh di file skrip .sh nya masing-masing dalam bentuk comment

_Penyelesaian_
1. Pertama saya membuat skrip untuk memantau penggunaan RAM
   
   `nano monitor_ram.sh`
   Lalu mengedit skrip tersebut seperti di bawah ini
```bash
   #!/bin/bash
#membuat command untuk pantau RAM usage
RAM_INFO=$(free -m)
`# informasi RAM akan disimpan dalam file log`
LOG_FILE="metrics_$(date +"%Y%m%d%H%M%S").log"
echo "$(date +"%Y-%m-%d %H:%M:%S") RAM Usage:
$RAM_INFO" >> ~/$LOG_FILE
```

Setelah membuat skrip, saya mengubah hak aksesnya

`chmod +x monitor_ram.sh`

2. Selanjutnya saya membuat skrip memantau ukuran directory
   `nano monitor_directory.sh`
   Isi dari skrip tersebut adalah sebagai berikut

```bash
   #!/bin/bash
# Path direktori untuk dilakukan monitor
TARGET_PATH="/home/$(whoami)/"

# command untuk mengecek ukuran directory target
DIRECTORY_SIZE=$(du -sh "$TARGET_PATH")

# Save informasi ukuran directory dalam file log sesuai format yang ada
LOG_FILE="metrics_$(date +"%Y%m%d%H%M%S").log"
echo "$(date +"%Y-%m-%d %H:%M:%S") Directory Size - $TARGET_PATH:
$DIRECTORY_SIZE" >> ~/$LOG_FILE
```

Setelah skrip dibuat, saya mengubah hak aksesnya
`chmod +x monitor_directory.sh`

Agar metrics dapat dicatat dan berjalan otomatis tiap menit, saya menggunakan crontab
`crontab -e`
Lalu memasukkan code berikut pada bagian paling bawah dari crontab

```bash
* * * * * /home/gallant/monitor_ram.sh
* * * * * /home/gallant/monitor_directory.sh
```

Pada soal 4c, diperlukan skrip untuk agregasi file log ke satuan jam
`nano aggregate_logs.sh`

```bash
#!/bin/bash
# Waktu saat ini diubah dalam bentuk YmdH
CURRENT_TIME=$(date +"%Y%m%d%H")

# Path untuk menuju directory log
LOG_DIR="/home/$(whoami)/"
# semua file log permenit akan digabungkan
cat "${LOG_DIR}metrics_"*.log > "${LOG_DIR}merged_logs.txt"
# Create file agregasi sesuai format
AGGREGATE_LOG="${LOG_DIR}metrics_agg_${CURRENT_TIME}.log"

# hitung nilai max, min, dan average pada metrics
MIN_RAM=$(awk '/RAM Usage/{getline; print}' "${LOG_DIR}merged_logs.txt" | awk '{print $3}' | sort -n | head -n1)
MAX_RAM=$(awk '/RAM Usage/{getline; print}' "${LOG_DIR}merged_logs.txt" | awk '{print $3}' | sort -n | tail -n1)
AVG_RAM=$(awk '/RAM Usage/{getline; print}' "${LOG_DIR}merged_logs.txt" | awk '{sum+=$3} END {print sum/NR}')
MIN_DIRECTORY=$(awk '/Directory Size/{getline; print}' "${LOG_DIR}merged_logs.txt" | awk '{print $5}' | sort -n | head -n1)
MAX_DIRECTORY=$(awk '/Directory Size/{getline; print}' "${LOG_DIR}merged_logs.txt" | awk '{print $5}' | sort -n | tail -n1)
AVG_DIRECTORY=$(awk '/Directory Size/{getline; print}' "${LOG_DIR}merged_logs.txt" | awk '{sum+=$5} END {print sum/NR}')

# Hasil di save dalam bentuk log
echo "Minimum RAM Usage: $MIN_RAM" >> "$AGGREGATE_LOG"
echo "Maximum RAM Usage: $MAX_RAM" >> "$AGGREGATE_LOG"
echo "Average RAM Usage: $AVG_RAM" >> "$AGGREGATE_LOG"
echo "Minimum Directory Size: $MIN_DIRECTORY" >> "$AGGREGATE_LOG"
echo "Maximum Directory Size: $MAX_DIRECTORY" >> "$AGGREGATE_LOG"
echo "Average Directory Size: $AVG_DIRECTORY" >> "$AGGREGATE_LOG"
```

Setelah skrip dibuat, perlu dilakukan perubahan hak akses dan perubahan pada file crontab
`chmod +x aggregate_logs.sh`

```bash
0 * * * * /home/gallant/aggregate_logs.sh
```

Agar file log tersebut hanya dapat dibaca oleh pemiliknya, maka saya akan mengubah hak aksesnya sebagai berikut
`chmod 600 /home/$(whoami)/*.log`

![Alt text](https://drive.google.com/file/d/1dW_puemk-KgYcKtbJok1TXaToFWDhBwO/view?usp=sharing)
