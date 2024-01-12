#!/bin/bash

echo "Welcome!!"

#here you find code for diff operations

add(){
    echo "Result: $(($1+$2))"
}

sub(){
	echo "Result: $(($1-$2))"
}

# Main script starts here

echo "Calculator Menu:"
echo "1. Addition\
      2. Substraction\
      3. Multiplication\
      4. Division\
      5. Exit"
      read -p "Enter your choice(1-5): " choice

case $choice in
	1) read -p "Enter 1st num: " num1
	 read -p "Enter 2nd num: " num2
	 add $num1 $num2
	 ;;

	2)  read -p "Enter 1st num: " num1
	         read -p "Enter 2nd num: " num2
		 		 sub $num1 $num2
				 ;;
	*) echo "Invalid choiuce"
		;;
esac
	
