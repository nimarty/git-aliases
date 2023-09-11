#!/bin/bash

ALL_ALIASES='shl pfl rbi sur'
INSTALL_PATH=~/.gitaliases

mkdir -p $INSTALL_PATH

for alias in $ALL_ALIASES; do 
  exists=$(git config --global --get-regexp ^alias.$alias)
  if [ ! -z "$exists" ]; then
    read -p "Alias '$alias' already exists, do you want to overwrite it? (Y/n) " yn
  fi
  case $yn in
    ""|[yY] ) 
      command="!sh ${INSTALL_PATH}/${alias}.sh";
      cp -f aliases/$alias.sh $INSTALL_PATH/;
      git config --global --unset-all alias.$alias;
      git config --global alias.$alias "${command}";
      echo "installed global alias '$alias' - (command: '$command')";;
    * ) 
      echo "skipped '$alias'";;
  esac
done;

