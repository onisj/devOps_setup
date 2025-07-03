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
