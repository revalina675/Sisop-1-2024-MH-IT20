#!/bin/bash

echo "Selamat Datang di Sistem Registrasi"

#fungsi untuk enkripsi psw menggunakan base64
enkripsi_password()
{
        echo -n "$1" | base64
}

#fungsi untuk cek apakah email sudah teregistrasi atau belum
check_duplicate_email()
{
        local email=$1
        grep -q "^$email:" users.txt
        return $?
}

#fungsi untuk user register
register_user ()
{
        local email=$1
        local username=$2
        local security_question=$3
        local security_answer=$4
        local password=$5
        local user_type="user"
#mengecek jika input email admin
        if [[ "$email" == admin ]]; then
                user_type="admin"
        fi
#enkripsi pasw
        enkripsi_password=$(enkripsi_password "$password")

#mengecek email sudah ter registrasi atau belum
        check_duplicate_email "$email"
        if [ $? -eq 0 ]; then
                echo "[ $(date +'%d%m%Y %H:%M:%S') ] [REGISTER FAILED] Email $email berhasil registrasi." >> auth.log
                echo "Email $email berhasil registrasi. Mohon masukkan email lain."
                exit 1
        fi

#memasukkan data ke user.txt menggunakan flag admin
        echo "$email:$usename:$security_question:$security_answer:$enkripsi_password:$user_type" >> users.txt

        if [[ $user_type == "admin" ]]; then
                echo "[ $(date +'%d%m%Y %H:%M:%S') ] [REGISTER SUCCESS] Admin $username berhasil registrasi." >> auth.log
                echo "Admin $username berhasil regitrasi"
        else
                echo "[ $(date +'%d%m%Y %H:%M:%S') ] [REGISTER SUCCESS] User $username berhasil regitrasi." >> auth.log
                echo "User $username berhasil registrasi"
        fi
}

touch users.txt

read -p "Email            : " email
read -p "Username         : " username
read -p "Security Question : " security_question
read -p "Security Answer   : " security_answer
read -sp "Password        : " password
echo

while true; do
        if [[ ${#password} -lt  8 || !("$password" =~ [[:lower:]]) || !("$password" =~ [[:upper:]]) || !("$password" =~ [0-9]) ]]; then
                echo -e  "!Password harus berjumlah 8 karakter atau lebih!\n!Tambahkan minimal 1 huruf kapital dan angka!"
                read -sp "Password: " password
                echo
        else
                break
        fi
done

register_user "$email" "$username" "$security_question" "$security_answer" "$password"
