#! /bin/bash
echo 'Installing Node'
nvm install v7.10.1
nvm alias default v7.10.1

echo 'Installing global node modules'
npm install -g yarn eslint_d flow-bin tern
