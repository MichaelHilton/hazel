#!/usr/bin/env bash

eval "$(ssh-agent -s)" #start the ssh agent
echo "$DEPLOY_KEY" > deploy_key.pem
chmod 600 deploy_key.pem # this key should have push access
ssh-add deploy_key.pem
git remote add deploy git@github.com:MichaelHilton/hazel.git
git push deploy gh-pages

# #!/bin/bash
# echo "Starting deployment"
# echo "Target: gh-pages branch"
#
# TEMP_DIRECTORY="/tmp/__temp_static_content"
# CURRENT_COMMIT=`git rev-parse HEAD`
# ORIGIN_URL=`git config --get remote.origin.url`
# ORIGIN_URL_WITH_CREDENTIALS=${ORIGIN_URL/\/\/github.com/\/\/$GITHUB_TOKEN@github.com}
#
# echo "Compiling new static content"
# cd ./src
# #bash ./build.sh
# cp -r ./www  $TEMP_DIRECTORY || exit 1
#
# echo "Checking out gh-pages branch"
# git checkout -B gh-pages || exit 1
#
# echo "Removing old static content"
# git rm -rf . || exit 1
#
# echo "Copying newly generated static content"
# mkdir ./www
# ls -la
# cp $TEMP_DIRECTORY/* . || exit 1
# cp $TEMP_DIRECTORY/.gitignore . || exit 1
#
# echo "Pushing new content to $ORIGIN_URL"
# git config user.name "Travis-CI" || exit 1
# git config user.email "travis@travis.com" || exit 1
#
# git add -A . || exit 1
# git commit --allow-empty -m "Regenerated static content for $CURRENT_COMMIT" || exit 1
# git push --force --quiet "$ORIGIN_URL_WITH_CREDENTIALS" gh-pages > /dev/null 2>&1
#
# echo "Cleaning up temp files"
# rm -Rf $TEMP_DIRECTORY
#
# echo "Deployed successfully."
# exit 0
#
#
