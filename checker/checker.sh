#!/bin/bash

if [[ $1 == "--help" ]]; then
	echo "\n\tBefore the option, enter the name of the file in *.c format.\n"
	echo "\t--[ ck ] For check others."
	echo "\t--[ cl ] For check and compile myself."
	echo "\t--[ lk ] Shortened display in case of leaks.\n" 
elif [[ $2 == "--ck" ]]; then
	clang-format -n $1
	cppcheck --enable=all --suppress=missingIncludeSystem $1
	gcc -std=c11 -Wall -Werror -Wextra $1
	leaks -atExit -- ./a.out $1
	echo
elif [[ $2 == "--cl" ]]; then
	clang-format -n $1
	cppcheck --enable=all --suppress=missingIncludeSystem $1
	gcc -std=c11 -Wall -Werror -Wextra $1
	leaks -atExit -- ./a.out $1
	echo
elif [[ $2 == "--lk" ]]; then
	leaks -atExit -- ./a.out | grep LEAK: $1
	echo
else
	echo "Invalid input.\n"
fi