#!/bin/bash

sudo killall nodejs;
sudo rm -rf ../bundle > /dev/null 2>&1;
sudo rm -rf ../bundle.tgz > /dev/null 2>&1;

sudo mrt bundle ../hacky_prod.tgz
cd ..;
sudo tar -zxvf hacky_prod.tgz;

export MONGO_URL='mongodb://localhost';
export ROOT_URL='http://hacky.co';
export BIND_IP='0.0.0.0';
export PORT=3000;

sudo -E forever restart hacky_prod/main.js || sudo -E forever start hacky_prod/main.js;

