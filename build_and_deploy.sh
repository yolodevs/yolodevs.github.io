#!/bin/bash
set -e # stop on error

echo bulid client ...

mkdir -p build
cp index.html build/
cp CNAME build/

echo reset master branch to devel ...
git fetch -f . devel:master
git checkout master
echo add build folder
git add -f build
echo commit changes
git commit -m "deploy to master"
echo push to remote master
git push origin `git subtree split --prefix build`:master --force
echo checkout branch devel
git checkout devel
echo All done!
