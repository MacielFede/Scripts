#!/bin/bash
echo -e "\033[32m -> I'm going to fetch the indicated branch from the set origin and force checkout to it.\033[0m"

read -p $'\e[32m -> Insert the branch you want to checkout to here: \e[0m: ' branch

git pull origin branch
if [ $? -ne 0 ]; then 
  echo -e "\033[31m -> There's a problem with the pull :(\033[0m"
  exit 1 
else 
  git checkout -f branch
  if [ $? -ne 0 ]; then 
    echo -e "\033[31m -> There's a problem with the checkout :( Debug the problem and try again later.\033[0m"
    exit 1
  else
    echo -e "\033[33m -> All finished :)\033[0m"
  fi 
fi 