It is script for check file *.c.
Before use, transfer to the directory of the desired file!

General command formula:
	
	sh checker.sh <file_name> --[ i or n for clang][ c for cppcheck][ g or gf use flag or no]

		OR

	sh checker.sh <file_name> -[ a ] full scan and compile

To check a program for memory leaks:

	sh checker.sh <file_name> --[ l ]

You can take more info if run script with --[ help ] option.
	