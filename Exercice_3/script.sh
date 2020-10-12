#!/bin/bash

function listUsername() {
  for username in $(cat /etc/passwd )
  do  
    tmp=$( echo $username | cut -d: -f1)
   done

    if [ $1 = $tmp ];then
      echo "Le nom d'utilisateur $1 existe déjà."
    else
      echo "Le nom d'utilisateur $1 n'existe pas."
    fi
}

listUsername "$1"
