#!/usr/bin/env bash

# Put symlinks to applicable devcontainer for a subset of GildedRose sub-directories.
# (delete any previous symlink or actual .devcontainer directory)

set -eu # 👉 https://explainshell.com/explain?cmd=set+-eux

DEVC_DIRNAME=.devcontainer

DEVC_BASE_DIR=${PWD}/devcontainers
REPO_BASE_DIR=${PWD}/GildedRose-Refactoring-Kata

[ ! -d "${DEVC_BASE_DIR}" ] && echo "Dev-containers directory doesn't exist." && exit 1
[ ! -d "${REPO_BASE_DIR}" ] && echo "Repository directory doesn't exist." && exit 1

CPP_DEVC_DIR=${DEVC_BASE_DIR}/cpp/${DEVC_DIRNAME}
CSHARP_DEVC_DIR=${DEVC_BASE_DIR}/csharp/${DEVC_DIRNAME}
GO_DEVC_DIR=${DEVC_BASE_DIR}/go/${DEVC_DIRNAME}
JAVA_DEVC_DIR=${DEVC_BASE_DIR}/java/${DEVC_DIRNAME}
NODE_DEVC_DIR=${DEVC_BASE_DIR}/node/${DEVC_DIRNAME}
PYTHON_DEVC_DIR=${DEVC_BASE_DIR}/python/${DEVC_DIRNAME}

C_PROJ_DIR=${REPO_BASE_DIR}/c99
CSHARP_PROJ_DIR=${REPO_BASE_DIR}/csharpcore
CPP_PROJ_DIR=${REPO_BASE_DIR}/cpp
GO_PROJ_DIR=${REPO_BASE_DIR}/go
JAVA_PROJ_DIR=${REPO_BASE_DIR}/Java
JS_PROJ_DIR=${REPO_BASE_DIR}/js-jest
PY_1_PROJ_DIR=${REPO_BASE_DIR}/python
PY_2_PROJ_DIR=${REPO_BASE_DIR}/python-pytest
TS_PROJ_DIR=${REPO_BASE_DIR}/TypeScript

# remove any existing links
find  ${REPO_BASE_DIR} -name ${DEVC_DIRNAME} -exec rm -rf {} \;

set -eux

ln -s ${CPP_DEVC_DIR} ${C_PROJ_DIR}/${DEVC_DIRNAME}
ln -s ${CSHARP_DEVC_DIR} ${CSHARP_PROJ_DIR}/${DEVC_DIRNAME}
ln -s ${CPP_DEVC_DIR} ${CPP_PROJ_DIR}/${DEVC_DIRNAME}
ln -s ${GO_DEVC_DIR} ${GO_PROJ_DIR}/${DEVC_DIRNAME}
ln -s ${JAVA_DEVC_DIR} ${JAVA_PROJ_DIR}/${DEVC_DIRNAME}
ln -s ${NODE_DEVC_DIR} ${JS_PROJ_DIR}/${DEVC_DIRNAME}
ln -s ${PYTHON_DEVC_DIR} ${PY_1_PROJ_DIR}/${DEVC_DIRNAME}
ln -s ${PYTHON_DEVC_DIR} ${PY_2_PROJ_DIR}/${DEVC_DIRNAME}
ln -s ${NODE_DEVC_DIR} ${TS_PROJ_DIR}/${DEVC_DIRNAME}

# Clean slate
docker container prune --force
docker volume rm vscode --force
