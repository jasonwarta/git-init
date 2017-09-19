#!/usr/bin/env bash

read -p "Enter you github username: " username
read -p "Enter your github personal access token: " token

echo "export GIT_USERNAME=\"$username\"" >> ~/.bashrc
echo "export GIT_TOKEN=\"$token\"">> ~/.bashrc
echo "alias git-init=\"$(pwd)/git-init.sh\"" >> ~/.bashrc

chmod +x git-init.sh