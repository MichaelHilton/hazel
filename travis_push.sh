#!/bin/sh

setup_git() {
  git config --global user.email "michael.hilton@gmail.com"
  git config --global user.name "git"
}

commit_website_files() {
  git clone https://github.com/MichaelHilton/hazelgrove.github.io.git
  cd hazelgrove.github.io/
  cp -r ../src/www/ ./
  cd www
  touch test.txt
  git add .
  git commit --message "Travis build: $TRAVIS_BUILD_NUMBER"
}

upload_files() {
  
  # Get the deploy key by using Travis's stored variables to decrypt deploy_key.enc
 # ENCRYPTED_KEY_VAR="encrypted_${ENCRYPTION_LABEL}_key"
 # ENCRYPTED_IV_VAR="encrypted_${ENCRYPTION_LABEL}_iv"
 #ENCRYPTED_KEY=${!ENCRYPTED_KEY_VAR}
  #ENCRYPTED_IV=${!ENCRYPTED_IV_VAR}
  #pwd
  #cd ..
  #cd ..
  #pwd
  #ls
  #openssl aes-256-cbc -K encrypted_0900be937efe_key -iv encrypted_0900be937efe_iv -in ../../pages-deploy-key.enc -out pages_deploy_key -d
  chmod 600 ../../pages-deploy-key
  eval `ssh-agent -s`
  ssh-add ../../pages-deploy-key

  # Now that we're all set up, we can push.
  #git push $SSH_REPO $TARGET_BRANCH
  
  #git remote add origin-pages https://${GH_TOKEN}@github.com/MVSE-outreach/resources.git > /dev/null 2>&1
   #https://github.com/MichaelHilton/hazelgrove.github.io.git
   git push origin master  
   #&2>/dev/null
  # git push -f -q https://cirosantilli:$GITHUB_API_KEY@github.com/cirosantilli/gnuplot-examples-gh-pages gh-pages &2>/dev/null

  #git push --quiet
}

setup_git
commit_website_files
upload_files
