#!/bin/bash

while getopts "u:" arg; do
  case $arg in
    u) site=$OPTARG;;
  esac
done

subfinder -d $site > subs.txt; cat subs.txt | httpx --silent > valid.txt; cat valid.txt | waybackurls > way.txt; 
cat way.txt | grep = > params.txt

cat params.txt | kxss
