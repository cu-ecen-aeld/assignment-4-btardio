# Todo

kernel headers match buildroot headers
 
# Dev

sudo docker build -t myubuntu . && sudo docker container run -it -v /var/run/docker.sock:/var/run/docker.sock -v ./:/repo myubuntu /bin/bash

# Overview

This repository contains assignment starter code for buildroot based assignments for the course Advanced Embedded Software Design, ECEN 5713

It also contains instructions related to modifying your buildroot project to use with supported hardware platforms.  See [this wiki page](https://github.com/cu-ecen-5013/buildroot-assignments-base/wiki/Supported-Hardware) for details.
