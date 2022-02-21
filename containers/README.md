# Containers

folders for containers I constantly use but do not want to install/bloat my
workstation with.

This repo is inspired by Marcel Dempers' [my-desktop](https://github.com/marcel-dempers/my-desktop) and Jessie Frazelle's [dockerfiles](https://github.com/jessfraz/dockerfiles)

## Project function:
1. Source main.bash in your bashrc/zshrc
2. main.bash sources the load.bash file in each tool directory
2. main.bash sources the load.bash file in the main directory for global
   functions

## New Tool process

Copy the template folder and modify the dockerfile and load.bash file as needed
