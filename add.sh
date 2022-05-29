#!/bin/zsh
#This shell script **CANNOT** work properly in Bash (maybe include zsh, unless add `setopt no_nomatch` to your .zshrc)
#echo "setopt no_nomatch" > ~/.zshrc && source ~/.zshrc

filename=$(basename $1)
cp $1 ./${filename}
git add ./${filename}
git commit -m "Upload ${filename}"
git push origin master
echo $(echo "${${$(git remote -v)##*origin}%.git*}" | sed "s/[[:space:]]//g")"/blob/master/${filename}?raw=true"
