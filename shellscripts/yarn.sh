#!/bin/bash

#Yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
#--no-install-recommends  -- parametro para nao instalar o node
sudo apt update && sudo apt install --no-install-recommends yarn
