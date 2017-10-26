#!/usr/bin/env bash

echo 'DEPLOY TO HEROKU!!!'

git checkout -b deploy

git pull heroku master
elm-app build
git add -f build
git commit --allow-empty -m 'Deploying'
git push heroku deploy:master

git checkout master
git branch -D deploy
