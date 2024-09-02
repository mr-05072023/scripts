#!/bin/bash

touch TEMP_FILE.txt
exec | ssh-keygen > TEMP_FILE.txt
if [[ $(cat TEMP_FILE.txt) == "Generating public/private rsa key pair.\nEnter file in which to save the key (/Users/guest/.ssh/id_rsa):" ]]; then
	echo
fi
if [[ $(cat TEMP_FILE.txt) == "/Users/guest/.ssh/id_rsa already exists.\nOverwrite (y/n)?" ]]; then
	yes
fi
if [[ $(cat TEMP_FILE.txt) == "Enter passphrase (empty for no passphrase):" ]]; then
	echo
fi
if [[ $(cat TEMP_FILE.txt) == "Enter same passphrase again:" ]]; then
	echo
fi
rm TEMP_FILE.txt
pbcopy < ~/.ssh/id_rsa.pub
	