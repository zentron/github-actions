#!/bin/sh -l

echo "Hellos $1"
time=$(date)
echo ::set-output name=time::$time