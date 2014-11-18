#!/bin/bash

sudo meteor build ../hacky_prod

export MONGO_URL='mongodb://localhost:27017/hacky';
export ROOT_URL='http://hacky.co';
export BIND_IP='0.0.0.0';
export PORT=3000;

cd ../hacky_prod;
sudo tar xvzf hacky_src.tar.gz

(cd bundle/programs/server && sudo npm install);
cd bundle;

sudo -E forever restart -l forever.log -o out.log -e err.log -a main.js || sudo -E forever start -l forever.log -o out.log -e err.log -a main.js
