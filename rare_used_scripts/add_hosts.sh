#!/usr/bin/env bash

add_host() {
    if [[ $(ssh-keygen -F $1) != "" ]]; then
        echo "found"
    else
        echo "not found"
        ssh-keyscan $1 >> ~/.ssh/known_hosts
    fi
}

add_host my_host
