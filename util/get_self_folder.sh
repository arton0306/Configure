#! /bin/bash

dirname "$0" | xargs readlink -e | xargs dirname
