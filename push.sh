#!/bin/bash

DATE="$(date +%Y-%m-%d\ %H:%M:%S)"
COMMIT_MESSAGE="Blog Update"\ ${DATE}

# Build blog...
hugo -t hugo-PaperMod
wait

# blog github upload
echo "Github Blog uploading..."
cd public
git add --all
git commit -m " ${COMMIT_MESSAGE}"
git push --force -u origin master
echo "Github Blog done..."
wait

echo "Backup Blog uploading..."
cd ..
git add --all
git commit -m " ${COMMIT_MESSAGE}"
git push --force -u origin master
echo "Backup Blog done..."