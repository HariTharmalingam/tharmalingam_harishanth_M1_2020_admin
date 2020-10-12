#!/bin/bash

function fileStatus() {
  if [ -f $3 ]
  then 
    sudo chown $1:$2 $3
    echo "Vous avez modifié les droits du fichier $3"
  else
    echo "Veuillez choisir un fichier valide."
  fi
}

printf "Quel utilisateur voulez vous ajouter aux droits du fichiers ? "
read userName
printf "Quel groupe voulez vous ajouter aux droits du fichiers ? "
read groupName
printf "Quel fichier voulez vous modifier les droits ? "
read fileName

fileStatus $userName $groupName $fileName
