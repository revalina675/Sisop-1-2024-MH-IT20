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

-->gambar 1

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

--> gambar 2

- Mengubah konfigurasi agar menjadi executable
```bash
chmod +x sandbox.csv
```

- Menjalankan file scirpt bash
```bash
./sandbox.sh
```

- hasil output
  
--> gambar 3

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
