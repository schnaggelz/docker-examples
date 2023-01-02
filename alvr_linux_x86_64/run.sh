#!/bin/bash

docker run  --user $(id -u):$(id -g) -it -v $(pwd):/home ubuntu-alvr-build:latest 
