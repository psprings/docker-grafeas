#!/bin/sh

if [ -d grafeas ]; then
    rm -rf grafeas
fi
git clone https://github.com/grafeas/grafeas.git
cp -R build-files grafeas
cp Dockerfile grafeas
cd grafeas
docker build -t grafeas .