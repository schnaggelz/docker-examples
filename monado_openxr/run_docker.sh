
docker run --user $(id -u):$(id -g) -it -v $(pwd)/docker:/home/monado/host ubuntu-monado-openxr-build:latest
