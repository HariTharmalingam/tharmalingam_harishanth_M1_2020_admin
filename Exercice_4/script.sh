#!/bin/bash

function listGroups() {
  for group in $(cat /etc/group )
  do
    tmp=$( echo $group | cut -d: -f1)
   done

    if [ $1 = $tmp ];then
      echo "Le groupe $1 existe déjà."
    else
      echo "Le groupe $1 n'existe pas."
    fi
}

listGroups "$1"

