#!/bin/sh

# while true; do
    # fetch all tags
    git fetch --all --tags &> /dev/null

    # get current version
    VERSION=`git tag -l --sort=-committerdate build-no* | head -n 1 | awk '{ split($0, a, "/"); print a[2]}'`

    NEXT_VERSION=$(($VERSION + 1))

    echo $NEXT_VERSION
# done
