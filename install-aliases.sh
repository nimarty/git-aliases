#!/bin/bash

ALL_ALIASES='shl pfl rbi sur'
INSTALL_PATH=~/.gitaliases

mkdir -p $INSTALL_PATH

for alias in $ALL_ALIASES; do 
  command="!sh ${INSTALL_PATH}/${alias}.sh"
  echo "install global alias '$alias' - (command: '$command')"
  cp -f aliases/$alias.sh $INSTALL_PATH/
  git config --global --unset-all alias.$alias
  git config --global alias.$alias "${command}"
done;
