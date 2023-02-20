#!/usr/bin/env bash

# Pull all base images used for the various dev-containers

set -eu # 👉 https://explainshell.com/explain?cmd=set+-eux

# Implicitly pull by building images based on the "FROM" part in an existing Dockerfile
# (or "image" part in devcontainer.json files)
function build_baseimage_dockerfile {
  local ORG_DOCKERFILE=$1
  local TEMP_BUILD_DIR=/tmp/baseimage
  mkdir -p ${TEMP_BUILD_DIR}
  rm -rf ${TEMP_BUILD_DIR/*}

  echo "Extract baseimage definition from ${ORG_DOCKERFILE}:"
  cat ${ORG_DOCKERFILE} | grep -E "^ARG VARIANT|^FROM" > ${TEMP_BUILD_DIR}/Dockerfile
  docker build ${TEMP_BUILD_DIR}
  echo
}
function build_baseimage_devcontainer {
  local DEVCONTAINER_JSON=$1
  local TEMP_BUILD_DIR=/tmp/baseimage
  mkdir -p ${TEMP_BUILD_DIR}
  rm -rf ${TEMP_BUILD_DIR/*}

  echo "Extract baseimage definition from ${DEVCONTAINER_JSON}:"
  IMAGE=$(cat ${DEVCONTAINER_JSON} | grep image | grep -o mcr.*[^\",])
  if [ -z "$IMAGE" ]; then
    echo "No image definition found, skipping"
  else
    echo "FROM $IMAGE" > ${TEMP_BUILD_DIR}/Dockerfile
    docker build ${TEMP_BUILD_DIR}
    echo
  fi
}

DEVC_BASE_DIR=${PWD}/devcontainers
[ ! -d "${DEVC_BASE_DIR}" ] && echo "Dev-containers directory doesn't exist." && exit 1

# "Clever" way of calling local function from "find"
# 👉 https://unix.stackexchange.com/a/50695
export -f build_baseimage_dockerfile
export -f build_baseimage_devcontainer
find ${DEVC_BASE_DIR} -name Dockerfile -exec bash -c 'build_baseimage_dockerfile "$@"' bash {} \;
find ${DEVC_BASE_DIR} -name devcontainer.json -exec bash -c 'build_baseimage_devcontainer "$@"' bash {} \;
