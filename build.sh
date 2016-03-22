#!/bin/sh
set -e
set -x

apk -U add --virtual temp python-dev py-pip alpine-sdk python py-setuptools

pip install -r https://raw.githubusercontent.com/projectcalico/libcalico/master/build-requirements.txt
pip install git+https://github.com/projectcalico/libcalico.git

pyinstaller /code/policy_agent.py -ayF

apk del temp && rm -rf /var/cache/apk/*
