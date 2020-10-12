#!/bin/bash

groupStatus = "notDefined"

function listGroups() {
  for group in $(cat /etc/group )
  do
    tmp=$( echo $group | cut -d: -f1)

    if [ $1 = $tmp ];then
      $groupStatus = "exists"
    else
      $groupStatus = "dontExists"
    fi
  done

  if [ $groupStatus = "dontExists" ] && [ $2 = "add" ];then
    sudo groupadd "$1"
    echo "Le groupe a été ajouté"
  elif [ $groupStatus = "exists" ] && [ $2 = "add" ];then
    echo "$1 existe déjà"
  elif [ $groupStatus = "exists" ] && [ $2 = "delete" ];then
    sudo groupdel $1
    echo "$1 supprimé de /etc/group"
  else 
    echo "$1 n'existe pas."
  fi
}


printf "Voulez vous ajouter ou supprimer un groupe ? (add/delete) ? "
read choice

case $choice in 
  add)
    printf "Quel groupe voulez vous ajouter ? "
    read groupName
    listGroups $groupName "add"
    ;;
  delete)
    printf "Quel groupe voulez vous supprimer ? "
    read groupName
    listGroups $groupName "delete"
esac



