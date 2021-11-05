#!/usr/bin/env bash
set -euo pipefail

pipeline=$(spin pipeline get -a $1 -n "$1 Pipeline" --config /tmp/spin-config --gate-endpoint $2 2> /dev/null | grep -v Caching | jq .id | sed -e 's/"//g' || echo "false")

jq -n --arg id "$pipeline" '{"id":$id}'
