#!/usr/bin/env bash

cd $WORKDIR
mkdir -p ~/.ssh
echo "$SSH_KEY" > ~/.ssh/id_rsa
echo "$SSH_PUB" > ~/.ssh/id_rsa.pub
chmod 0600 ~/.ssh/id_rsa
chmod 0600 ~/.ssh/id_rsa.pub
ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts
