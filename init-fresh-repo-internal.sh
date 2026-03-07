#!/usr/bin/env bash

# Clone the INTERNAL GildedRose repo.
# Abort if there already is a clone.

set -eu # 👉 https://explainshell.com/explain?cmd=set+-eux

REPO_DIR=./internal_GildedRose-Refactoring-Kata

[ -d "${REPO_DIR}" ] && echo "Directory $REPO_DIR already exists" && exit 1

git clone https://github.com/uivraeus/GildedRose-Refactoring-Kata.git $REPO_DIR

pushd $REPO_DIR
git remote add internal https://github.com/uivraeus/GildedRose-Refactoring-Kata-internal.git
git fetch internal
for branch in $(git branch -r | grep 'internal/' | grep -v 'HEAD'); do
    git branch --track "${branch#internal/}" "$branch"
done
git pull --all
git config remote.pushDefault internal
popd
