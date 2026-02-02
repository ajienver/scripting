#!/usr/bin/bash

#creating some grocery files
touch fruits.txt veggies.txt snacks.txt

#Creating a new directory to store .txt files
mkdir -p grocery

#expand .txt files in the directory using  while loop
echo *.txt |tr ' ' '\n' | while read -r file
do
  mv "$file" grocery/
done

#navigate into the directory
cd grocery || exit 1

# Arrays of items
fruits=("apple" "banana" "orange")
veggies=("tomato" "broccoli" "spinach")
snacks=("chips" "cookies" "soda")

# Loop to write fruits
for item in "${fruits[@]}"
do
  echo "$item" >> fruits.txt
done

# Loop to write veggies
for item in "${veggies[@]}"
do
  echo "$item" >> veggies.txt
done

# Loop to write snacks
for item in "${snacks[@]}"
do
  echo "$item" >> snacks.txt
done

#using Until loop for simple countdown from 3
count=3
until [ $count -le 0 ]
do
  echo "Countdown: $count"
  sleep 1
  ((count--))
done

#compress them into a zip file
zip -q groceries.zip *.txt

#removing .txt since they are stored in zip file
rm *.txt

#showing a completion message
echo""
echo "Project complete! Your items are safely stored in your grocery list"

#show zip info 
echo ""
echo "Here’s what’s inside your grocery zip file:"
unzip -l groceries.zip
