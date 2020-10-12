#!/bin/bash

function fileExists() {
  if [ -f "$1" ]; then
      modifyFile "$1" "$2"
  else 
      echo "Le fichier $1 n'existe pas."
      echo "Veuillez renseigner un fichier existant et une action. Exemple : bash script.sh nom_fichier copy/delete/read"
  fi
}

function modifyFile() {
  case "$2" in
    copy)
      sudo cp -v "$1" /tmp/
      ;;
    delete)
      sudo rm -rf "$1"
      ;;
    read)
      sudo cat "$1"
      ;;
  esac
}

fileExists "$1" "$2"
