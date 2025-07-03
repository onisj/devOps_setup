# CAPSTONE PROJECT: LINUX BASH SCRIPTING

# Multiplication Table Generator

## Objective
Create a Bash script that:
- Takes a user input number
- Offers a choice between full or partial multiplication table
- Displays results in ascending or descending order
- Demonstrates both list-form and C-style `for` loops

---

## 📁 Step 1: Create the Script File

On my terminal I create a new Bash script file as follows:

```bash
touch multiplication_table.sh
chmod +x multiplication_table.sh
nano multiplication_table.sh
```

📸 **Screenshot**  
![Step 1 Terminal Output](img/Step1.png)

---

## 🖊️ Step 2: Script Code

I also write a script code into the `multiplication_table.sh` using the following code:

```bash
#!/bin/bash

read -p "Enter a number for the multiplication table: " num

if ! [[ "$num" =~ ^-?[0-9]+$ ]]; then
  echo "Invalid number. Exiting."
  exit 1
fi

read -p "Do you want a full table or a partial table? (Enter 'f' for full, 'p' for partial): " mode

start=1
end=10

if [[ "$mode" == "p" ]]; then
  read -p "Enter the starting number (between 1 and 10): " start
  read -p "Enter the ending number (between 1 and 10): " end

  if ! [[ "$start" =~ ^[1-9]$|^10$ ]] || ! [[ "$end" =~ ^[1-9]$|^10$ ]] || [ "$start" -gt "$end" ]; then
    echo "Invalid range. Showing full table instead."
    start=1
    end=10
  fi
fi

read -p "Display order? (Enter 'a' for ascending, 'd' for descending): " order

if [[ "$order" == "a" ]]; then
  echo -e "\n[List-Form Loop] Multiplication Table for $num:"
  for i in $(seq $start $end); do
    echo "$num x $i = $((num * i))"
  done
elif [[ "$order" == "d" ]]; then
  echo -e "\n[C-Style Loop] Multiplication Table for $num (Descending):"
  for ((i=end; i>=start; i--)); do
    echo "$num x $i = $((num * i))"
  done
else
  echo "Invalid order. Showing table in ascending order using list-form loop."
  for i in $(seq $start $end); do
    echo "$num x $i = $((num * i))"
  done
fi
```

📸 **Screenshot**  
![Step 2 Script Code](img/Step2.png)

---

## 🚀 Step 3: Run the Script

I run and execute the script using below:

```bash
./multiplication_table.sh
```

📸 **Screenshot**  
![Step 3 Run Script](img/Step3.png)

---

## 🧪 Step 4: Test Full Table (Ascending)

I test the script with the following input: 
- Number: 4
- Mode: Full
- Order: Ascending


📸 **Screenshot**  
![Step 4 Full Table](img/Step4.png)

---

## 🧪 Step 5: Test Partial Table (Descending)

Input:
- Number: 6
- Mode: Partial (start: 3, end: 7)
- Order: Descending


📸 **Screenshot**  
![Step 5 Partial Desc](img/step5.png)

---

## 🧪 Step 6: Test Invalid Input

Input:
- Number: abc (invalid)

📸 **Screenshot**  
![Step 6 Invalid Input](img/Step6.png)

---

## ✅ Conclusion

This script:
- Demonstrates both loop types
- Uses conditional logic
- Validates inputs
- Provides readable, user-friendly output
- Includes error handling for invalid input
