#!/usr/bin/env bash
set -euo pipefail

for i in $(ls -d */ | grep -v init-utils)
do
    echo $i
    terraform-docs markdown $i > $i/README.md
done
