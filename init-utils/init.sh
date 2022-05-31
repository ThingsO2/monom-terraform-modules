#!/usr/bin/env bash
set -euo pipefail

if [ -z "${TF_ORG}" ]; then
  echo "TF_ORG is required"
  exit 1
fi
if [ -z "${TF_ROOT_PATH}" ]; then
  echo "TF_ROOT_PATH is required"
  exit 1
fi
current=$(pwd)
WORKSPACE_PREFIX=${current##$TF_ROOT_PATH/}
# replace / with -
WORKSPACE_PREFIX=$(sed 's/\//-/g' <<< "${WORKSPACE_PREFIX}")
if [ -z "${WORKSPACE_PREFIX}" ]; then
  echo "TF_ROOT_PATH is wrong"
  exit 1
fi

read -p "Workspaces": WORKSPACES
if [ -z "${WORKSPACES}" ]; then
    cat <<EOF > main.tf
terraform {
  backend "remote" {
    organization = "$TF_ORG"
    workspaces {
      name = "$WORKSPACE_PREFIX"
    }
  }
}
EOF
    source $HOME/projects/TFE_TOKEN
    export TF_WORKSPACE=$WORKSPACE_PREFIX
    exec $(dirname $(realpath $0))/init
else
    cat <<EOF > main.tf
terraform {
  backend "remote" {
    organization = "$TF_ORG"
    workspaces {
      prefix = "$WORKSPACE_PREFIX-"
    }
  }
}
EOF
    for WORKSPACE in $(echo $WORKSPACES | tr "," "\n"); do
        echo "Creating workspace $WORKSPACE"
        source $HOME/projects/TFE_TOKEN
        export TF_WORKSPACE=$WORKSPACE_PREFIX-$WORKSPACE
        $(dirname $(realpath $0))/init
    done
fi
