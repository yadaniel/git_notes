#!/usr/bin/bash

# git log --format="%aN" | tr "." " " | tr -d "[:blank:]" | tr "[:upper:]" "[:lower:]" | sort | uniq -c | sort -r
git log --format="%aN" | tr "[:blank:]" "." | tr "[:upper:]" "[:lower:]" | sort | uniq -c | sort -r

