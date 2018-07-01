#!/usr/bin/env bash

image_name=$1
docker build --network host -t $image_name .
