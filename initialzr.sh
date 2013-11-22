#!/bin/bash

# Initialzr
# Copyright (c) 2012 Randell Quitain


if [[ ! -e $1 ]]; then

	# Update current directory
	echo "Warping into your local directory..."
	cd /Applications/XAMPP/htdocs/

	# Create the directory
	echo "Creating $1"
	mkdir $1
	cd $1

	# Git clone the repository
	echo "Sucking in the C4 boilerplate..."
	git clone $2

	# Clean directory
	cp -a c4/. /Applications/XAMPP/htdocs/$1
	rm -rf /Applications/XAMPP/htdocs/$1/c4

	# Git fetch & checkout - Mobile responsive branch
	git fetch && git checkout $3

	# Start up SASS
	cd /Applications/XAMPP/htdocs/$1/theme/styles/
	sudo sass --watch sass:. --no-cache --style compressed

elif [[ ! -d $1 ]]; then

	echo "$1 already exists but is not a directory" 1>&2

fi