#!/bin/bash

usernameStatus = "notDefined"

function listUsername() {
  for username in $(cat /etc/passwd )
  do
    tmp=$( echo $username | cut -d: -f1)

    if [ $1 = $tmp ];then
      $usernameStatus = "exists"
    else
      $usernameStatus = "dontExists"
    fi
  done

  if [ $usernameStatus = "dontExists" ] && [ $2 = "add" ];then
    sudo useradd -m -p "$1" "$3"
    echo "L'utilisateur a été ajouté"
  elif [ $usernameStatus = "exists" ] && [ $2 = "add" ];then
    echo "$1 existe déjà"
  elif [ $usernameStatus = "exists" ] && [ $2 = "delete" ];then
    sudo deluser $1
    echo "$1 supprimé de /etc/passwd."
  else 
    echo "$1 n'existe pas."
  fi
}


printf "Voulez vous ajouter ou supprimer un nom d'utilisateur ? (add/delete) ? "
read choice

case $choice in 
  add)
    printf "Quel nom d'utilisateur voulez vous ajouter ? "
    read userName
    printf "Choississez un mot de passe : "
    read password
    listUsername $userName "add" $password
    ;;
  delete)
    printf "Quel nom d'utilisateur voulez vous supprimer ? "
    read userName
    listUsername $userName "delete"
esac


