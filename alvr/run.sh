#!/bin/bash

docker run  --user $(id -u):$(id -g) -it -v $(pwd):/home/build ubuntu-alvr-build:latest 
