#!/usr/bin/env bash

# Pull all base images used for the various dev-containers

set -eu # 👉 https://explainshell.com/explain?cmd=set+-eux

./apt-upgrade.sh
echo "=========================================================================="
./init-fresh-repo.sh
echo "=========================================================================="
./add-devcontainers.sh
echo "=========================================================================="
./pull-base-images.sh
echo "=========================================================================="
