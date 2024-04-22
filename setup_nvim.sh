#!/bin/bash

#this only works for ubuntu and arch, it would probably be better to clone and build it from source
if [[ -n $(ls /usr/bin | grep -sw 'nvim' )]]; then
	if [[ -n $(ls /usr/bin | grep -sw 'pacman')]]; then
		#arch detected
		echo 'Arch Linux detected'
		sudo pacman -Syu neovim
	elif [[ -n $(ls /usr/bin | grep -sw 'apt')]]; then
		#ubuntu detected
		echo 'Ubuntu detected'
		sudo apt-get install neovim
	else 
		echo 'Unknown operating system -- i need to just build from source instead'
	fi
else echo 'neovim is already installed'
fi

echo -n "neovim is installed. Proceed with cloning config? [y/n]"
read -r ans
if [[ $ans -eq 'y']]; then
	echo 'Cloning...'
	mkdir -p ~/.config/nvim
	git clone https://github.com/connorcinna/vimrc.git ~/.config/nvim/
elif [[ $ans -eq 'n']]; then
	echo 'Terminating'
else
	echo "Unknown option $(ans)"
fi


