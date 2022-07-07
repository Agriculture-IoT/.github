#/bin/bash

export DEBIAN_FRONTEND=noninteractive

sudo apt update -y

sudo DEBIAN_FRONTEND=noninteractive apt install -y build-essential python3
sudo DEBIAN_FRONTEND=noninteractive apt install -y python3-pip git

python3 -m pip install virtualenv
python3 -m virtualenv /edgeserver/.venv
source /edgeserver/.venv/bin/activate
pip install --upgrade pip
pip install --upgrade setuptools
export CFLAGS=-fcommon
pip install RPi.GPIO
