#!/bin/bash
# A bash script to generate a random directory structure with subfolders and files

read -p "Please enter directory /../../DIR : " directory
read -p "Please enter the depth of nesting: " max_depth
#read max_size
read -p "Please enter max amount of files and folders to be created: " max_iterations

cd $directory

num=1
nom=1
nem=1

depth=$(( ( RANDOM % $max_depth - 2 )  + 3 ))
iterations=$(( ( RANDOM % $max_iterations - 2)  + 3 ))

while [ $nem -le $depth ]; do
	while [ $num -le $iterations ]; do
		sudo mkdir "$(( RANDOM % 99999999 ))"
		num=$[ $num + 1 ]
	done

	shopt -s nullglob
	dirs=(*/)
	[[ $dirs ]] && cd -- "${dirs[RANDOM%${#dirs[@]}]}"

	while [ $nom -le $iterations ]; do
		sudo touch "$(( RANDOM % 99999999 ))".md
		nom=$[ $nom + 1 ]
	done
	nem=$[ $nem + 1 ]
done
