#!/bin/bash

git clone git@github.com:alvr-org/ALVR.git alvr
docker run  --user $(id -u):$(id -g) -it -v $(pwd):/home/build ubuntu-alvr-build:latest 
