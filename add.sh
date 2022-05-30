#!/bin/zsh
#This shell script **CANNOT** work properly in Bash (maybe include zsh, unless add `setopt no_nomatch` to your .zshrc)
#echo "setopt no_nomatch" > ~/.zshrc && source ~/.zshrc

cd $(dirname $0)
while test $# -gt 0
do
filename=$(basename $1)
ln -h $1 ./${filename}
git add ./${filename}
git commit -qm "Upload ${filename}"
git push -q origin master
echo $(echo "${${$(git remote -v)##*origin}%.git*}" | sed "s/[[:space:]]//g")"/blob/master/${filename}?raw=true"
shift
done
