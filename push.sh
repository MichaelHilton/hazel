#!/bin/sh

setup_git() {
  git config --global user.email "michael.hilton@gmail.com"
  git config --global user.name "MichaelHilton"
}

commit_website_files() {
  git clone https://github.com/MichaelHilton/hazelgrove.github.io.git
  cd hazelgrove.github.io/
  cp -r ../src/www/ ./
  cd www
  git add .
  git commit --message "Travis build: $TRAVIS_BUILD_NUMBER"
}

upload_files() {
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
