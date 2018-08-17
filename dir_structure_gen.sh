#!/bin/bash
# A bash script to generate a random directory structure with subfolders and files

read -p "Please, enter directory /../../DIR : " directory
read -p "Please, enter the depth of nesting: " max_depth
read -p "Please, enter max size of a file: " max_size
read -p "Please, enter max amount of files and folders to be created: " max_items

mkdir -p /home/eugene/work/bash_scripts/$directory
cd /home/eugene/work/bash_scripts/$directory

depth=$(( ( RANDOM % ( $max_depth - 1 ) ) + 1 ))

dc=1
dc1=1

while [ $dc1 -le $depth ]; do

	while [ $dc -le $depth ]; do

		if [ $(( $( ls -l | wc -l ) - 1 )) -eq 0 ]
		then
			items=$(( ( RANDOM % ( $max_items - 1 ) ) + 1 ));
			for i in `seq "$items"`; do mkdir -p "$(( RANDOM % 99999999 ))"; done;
			items=$(( ( RANDOM % ( $max_items - 1 ) ) + 1 ));
			for i in `seq "$items"`; do touch "$(( RANDOM % 99999999 ))".md; done;
		fi

	dirs=(*/)
	cd "${dirs[RANDOM%${#dirs[@]}]}"
	dc=$[ $dc + 1 ]

    done

    depth=$(( ( RANDOM % ( $max_depth - 1 ) ) + 1 ))
    cd /home/eugene/work/bash_scripts/$directory
    dc1=$[ $dc1 + 1 ]
    dc=1

done
