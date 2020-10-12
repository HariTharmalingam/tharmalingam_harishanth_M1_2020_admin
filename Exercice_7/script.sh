#!/bin/bash

function fileStatus() {
  if [ -f "$1" ] && [ $2 = "add" ];then
    echo "Le fichier $1 existe déjà."
  elif [ ! -f "$1" ] && [ $2 = "add" ];then
    touch $1
    echo "Le fichier $1 a été créé"
  elif [ -f ] && [ $2 = "delete" ];then
    sudo rm -rf $1
    echo "Le fichier $1 a été supprimé"
  else 
    echo "Le fichier $1 n'existe pas."
  fi
}


printf "Voulez vous ajouter ou supprimer un fichier ? (add/delete) ? "
read choice

case $choice in 
  add)
    printf "Quel fichier voulez vous ajouter ? "
    read fileName
    fileStatus $fileName "add"
    ;;
  delete)
    printf "Quel fichier voulez vous supprimer ? "
    read fileName
    fileStatus $fileName "delete"
esac

