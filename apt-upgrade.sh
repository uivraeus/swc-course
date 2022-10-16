#!/usr/bin/env bash

# Pull all base images used for the various dev-containers

set -eu # 👉 https://explainshell.com/explain?cmd=set+-eux

sudo apt update
sudo apt upgrade -y
