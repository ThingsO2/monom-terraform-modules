#!/usr/bin/env bash
set -euo pipefail

for i in $(ls -d */)
do
    terraform-docs markdown $i > $i/README.md
done
