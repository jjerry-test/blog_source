#!/bin/bash

DATE="$(date +%Y-%m-%d\ %H:%M:%S)"
COMMIT_MESSAGE="Blog Update"\ ${DATE}

# Build blog...
hugo -t liva-hugo
wait

# blog github upload
echo "Github Blog uploading..."
cd public
git add --all
git commit -m " ${COMMIT_MESSAGE}"
git push
echo "Github Blog done..."
wait

echo "Backup Blog uploading..."
cd ..
git add --all
git commit -m " ${COMMIT_MESSAGE}"
git push
echo "Backup Blog done..."