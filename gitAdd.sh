#!/bin/bash
echo "I'm going to commit every change in your project and push it to the origin."
echo "Remember to execute the file being on the projects root, and in your working branch."

# echo "Reminder:\nIf you want to change your projects root you have to change it in the projectRoot.txt file that is in the same folder as this file"
branch=$(git symbolic-ref --short HEAD)
#This command asigns the output of git symbolic-ref --short HEAD to the variable "branch". 
#Essentally I'm getting the actual branch that you are standing on
read -p "Insert your commit message: " message

# if ! [ -e ./projectRoot.txt ];
# The line above checks if the projectRoot.txt file exists
# then
#   read -p "Insert your projects root folder: " root
#   echo $root > projectRoot.txt
# else
#   root=$(cat ./projectRoot.txt)
# fi

# All the code commented reffers to the old way that I did this script. 
# In that solution the user had to insert the project root manualy

git add .
git commit -am "$message"
# commit all the changes made with a message provided by the user
git push -u origin $branch
# push changes to remote repo in the branch that you are standing on