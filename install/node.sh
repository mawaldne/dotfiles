#! /bin/bash
echo 'Installing Node'
nvm install v7.2.0
nvm alias default v7.2.0

echo 'Installing global node modules'
npm install -g yarn eslint_d flow-bin tern
