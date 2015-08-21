# Build Boost with Docker
## Goal
Building boost with custom options without touching the current system

# Requirements
- docker
- docker-compose

# How to use it
```
docker-compose up
```

Downloading the docker image, all prequisites and boost can take some time
Compiling boost also takes a fair amount of time, depending on your
setup and compile options.

# How to customize it
Change the options set in *docker/build_boost.sh* and start the process again

# How to use other distributions than CentOS
It should basically work with modifying Dockerfile to a different distribution,
just install the necessary packages needed to build boost
