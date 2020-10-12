#!/bin/bash

function argumentsExist() {
  if [ $1 -ne 0 ]
  then
	filesExist "$2"

  else
      echo "Veuillez mettre le nom d'un ou de plusieurs fichiers."
      echo "Exemple : script.sh nom_fichier"
      exit 2
  fi
}

function filesExist() {
  for arg in $@
  do
    if [ -f "$arg" ]; then
        echo "Le fichier $arg existe !"
    else 
        echo "Le fichier $arg n'existe pas..."
    fi
  done
}

argumentsExist "$#" "$*"
