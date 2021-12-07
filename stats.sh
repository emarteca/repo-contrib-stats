#!/bin/bash

# usage: ./stats.sh repo
# example usage: ./stats.sh https://github.com/reallyTG/typeR 

repo_name=$1

git clone $repo_name TempDir 
cd TempDir

git shortlog -sn --all > temp.txt

# for each contributor, print (in csv)
# name, num_commits, total_LOC_added, total_LOC_deleted
echo -e "\nAuthor name, num commits, num LOC added, num LOC deleted -- across ALL branches\n"
while IFS= read -r line; do
  num_commits=`echo $line | awk '{print $1}'`
  author_name=`echo $line | awk '{$1 = ""; print $0}' | xargs`
  file_sums=`git log --author="$author_name" --format=tformat: --numstat --all 2>/dev/null | 
  	awk '{
  			add_sum+=$1; 
  		  	del_sum+=$2;
  		 } 
  		 END{
  		 	print add_sum ";" del_sum;
  		 }'`
  file_sums=(${file_sums//;/ })
  echo $author_name","$num_commits","${file_sums[0]}","${file_sums[1]}
done < temp.txt

cd ..
rm -rf TempDir


