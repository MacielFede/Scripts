#!/bin/bash
echo -e "\033[32m -> I'm going to commit every change in your project and push it to the origin with the branch your stood on.\033[0m"

branch=$(git symbolic-ref --short HEAD)
if [ $? -ne 0 ]; then 
  # The command failed, print an error message 
  echo -e "\033[31m -> You're not in a git repository :()\033[0m"
  # Exit the script with a non-zero exit status to indicate failure 
  exit 1 
fi 
#This command asigns the output of git symbolic-ref --short HEAD to the variable "branch". 
#Essentally I'm getting the actual branch that you are standing on
read -p $'\e[32m -> Insert your commit message here: \e[0m: ' message

git add .
git commit -am "$message"
# commit all the changes made with a message provided by the user
if [ $? -ne 0 ]; then 
  # The command failed, print an error message 
  echo -e "\033[31m -> There's a problem with your commit :(\033[0m"
  # Exit the script with a non-zero exit status to indicate failure 
  exit 1 
else
  git push -u origin $branch
  # push changes to remote repo in the branch that you are standing on
  if [ $? -ne 0 ]; then 
    echo -e "\033[31m -> There's a problem with your push :( Debug the problem and try again later.\033[0m"
    exit 1
  else
    echo -e "\033[33m -> All finished :)\033[0m"
  fi 
fi 