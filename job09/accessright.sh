#!/bin/bash

	INPUT='/~job09/Shell_Userlist.csv'
while IFS=, read -r Id Prenom Nom Mdp Role || [ -n "Roles" ]; do
	username=$Prenom$Nom
	usernew="$(echo "$username" | tr -d '[:space:]')"
	sudo useradd -p $(openssl passwd -1 $Mdp) $usernew

	if [[ $Role == A* ]]; then
		sudo usermod -aG sudo $username
	fi

done < $INPUT
