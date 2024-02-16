#!/bin/bash

while true; do
    echo "1. Create student record"
    echo "2. View all students"
    echo "3. Delete student by ID"
    echo "4. Update student record by ID"
    echo "5. Exit"
    read choice

    case $choice in
        1)
            echo "Enter student email:"
            read email
            echo "Enter student age:"
            read age
            echo "Enter student ID:"
            read student_id

            echo "$email, $age, $student_id" >> students-list_1023.txt
            ;;
        2)
            cat students-list_1023.txt
            ;;
        3)
            echo "Enter student ID to delete:"
            read delete_id
            sed -i "/$delete_id/d" students-list_1023.txt
            ;;
        4)
            echo "Enter student ID to update:"
            read update_id
            echo "Enter updated email:"
            read updated_email
            echo "Enter updated age:"
            read updated_age

            # Use a temporary file to perform the update
            sed "/^$update_id,/c\\$updated_email, $updated_age, $update_id" students-list_1023.txt > temp.txt
            mv temp.txt students-list_1023.txt
            ;;
        5)
            exit
            ;;
        *)
            echo "Invalid option. Please choose again."
            ;;
    esac
done
