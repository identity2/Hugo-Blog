#!/bin/bash

if [ $# -ne 1 ]
then
  echo "Error: You need an argument for the commit message."
  exit 1
fi

msg="$1"

echo "Building the Hugo site..."
hugo -t shineright_theme

echo "Pushing the public file to GitHub..."
cd public
git add .
git commit -m "$msg"
git push

echo "Pushing the Hugo project file to GiHub..."
cd ..
git add .
git commit -m "$msg"
git push