#!/bin/bash

# Fungsi yang digunakan untuk mengenkripsi password menggunaka base64
decode_base64() 
{
    echo "$1" | base64 --decode
}

# Fungsi untuk cek registrasi email
check_registered_email()
{
    local email=$1
    grep -q "^$email:" users.txt
    return $?
}

# Fungsi untuk mengautentikasikan user inputan
authenticate_user() 
{
    local email=$1
    local password=$2

    if check_registered_email "$email"; then
        encrypted_password=$(grep "^$email" users.txt | cut -d':' -f5)
        decrypted_password=$(decode_base64 "$encrypted_password")

        if [ "$password" == "$decrypted_password" ]; then
            echo "[ $(date +'%d/%m/%Y %H:%M:%S') ] [LOGIN SUCCESS] User with email $email logged in successfully." >> auth.log
            return 0
        else
            echo "[ $(date +'%d/%m/%Y %H:%M:%S') ] [LOGIN FAILED] ERROR: Incorrect password for user with email $email." >> auth.log
            echo "Incorrect password. Please try again or choose forgot password option."
            return 1
        fi
    else
        echo "[ $(date +'%d/%m/%Y %H:%M:%S') ] [LOGIN FAILED] ERROR: User with email $email not found." >> auth.log
        echo "Email not found. Please register first."
        return 1
    fi
}

# Fungsi untuk menghapus password
reset_password() 
{
    local email=$1

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

# Fungsi untuk menambah user
add_user() 
{
    ./register.sh
}

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

# Fungsi untuk menghapus user
delete_user() 
{
    local email=$1

#hapus user dari users.txt
    sed -i "/^$email:/d" users.txt
    echo "User $email deleted successfully"
    echo "[ $(date +'%d/%m/%Y %H:%M:%S') ] [USER DELETE] User with email $email deleted successfully" >> auth.log
}

# Main code

echo "~USER LOGIN~"
echo "1. Login"
echo "2. Forgot Password"
read -p "Choose an option: " option

case $option in
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
    2)
        read -p "Enter your email: " email
        reset_password "$email"
        ;;
    *)
        echo "Invalid option"
        ;;
esac
