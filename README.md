# PRAKTIKUM MODUL 01 SISTEM OPERASI
## Kelompok IT20
### Anggota Kelompok :
|             Nama              |     NRP    |
|-------------------------------|------------|
| Revalina Fairuzy Azhari Putri | 5027231001 |
| Farida Qurrotu 'Ayuna         | 5027231015 |
| Gallant Damas Hayuaji         | 5027231037 |

Daftar Soal
- [Soal 1](#soal1)
- [Soal 2](#soal2)
- [Soal 3](#soal3)
- [Soal 4](#soal4)

### Soal 1
Cipung dan abe ingin mendirikan sebuah toko bernama “SandBox”, sedangkan kamu adalah manajer penjualan yang ditunjuk oleh Cipung dan Abe untuk melakukan pelaporan penjualan dan strategi penjualan kedepannya yang akan dilakukan.

Setiap tahun Cipung dan Abe akan mengadakan rapat dengan kamu untuk mengetahui laporan dan strategi penjualan dari “SandBox”. Buatlah beberapa kesimpulan dari data penjualan “Sandbox.csv” untuk diberikan ke cipung dan abe 

a. Karena Cipung dan Abe baik hati, mereka ingin memberikan hadiah kepada customer yang telah belanja banyak. Tampilkan nama pembeli dengan total sales paling tinggi

b. Karena karena Cipung dan Abe ingin mengefisienkan penjualannya, mereka ingin merencanakan strategi penjualan untuk customer segment yang memiliki profit paling kecil. Tampilkan customer segment yang memiliki profit paling kecil

c. Cipung dan Abe hanya akan membeli stok barang yang menghasilkan profit paling tinggi agar efisien. Tampilkan 3 category yang memiliki total profit paling tinggi 

d. Karena ada seseorang yang lapor kepada Cipung dan Abe bahwa pesanannya tidak kunjung sampai, maka mereka ingin mengecek apakah pesanan itu ada. Cari purchase date dan amount (quantity) dari nama adriaens

*penyelesaian*

- Buat sebuah folder dengan command berikut :

*disini saya membuat folder dengan nama SandBox*

```bash
mkdir SandBox
```

`mkdir` command untuk membuat directory

`SandBox` nama directory yang ingin dibuat

- Masuk ke dalam folder SandBox


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

### Soal 3
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
