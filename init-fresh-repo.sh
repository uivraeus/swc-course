#!/usr/bin/env bash

# Clone the GildedRose repo.
# If there already is a clone, remove that version first.

set -eu # 👉 https://explainshell.com/explain?cmd=set+-eux

REPO_DIR=./GildedRose-Refactoring-Kata

[ -d "${REPO_DIR}" ] && rm -rf ${REPO_DIR}

git clone https://github.com/uivraeus/GildedRose-Refactoring-Kata.git $REPO_DIR
