#!/bin/sh

if [ -f ~/.vimrc ]
then
	echo "file .vimrc found, backup as .vimrc_old"
	if [ -f ~/.vimrc_old ]
	then
		echo "file .vimrc_old found, delete it"
		rm ~/.vimrc_old
	fi
	mv ~/.vimrc ~/.vimrc_old
fi

cp ./.vimrc ~/

if [ -f ~/.vimrc ]
then
	echo "OK"
else
	echo "ERROR"
fi

exit 0
