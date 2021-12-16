#!/bin/bash

set -euo pipefail

MOD_PATH=$1

#sudo apt install -yqq python3-venv
python3 -m pip install -q -q -q virtualenv
# Creates a new virtualenv
python3 -m venv $MOD_PATH/venv

# Install dependencies
$MOD_PATH/venv/bin/python -m pip install -q -q -q -r $MOD_PATH/requirements.txt

echo '{"done": "yes"}'

