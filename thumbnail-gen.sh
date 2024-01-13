#!/usr/bin/env bash

for x in *.{jpg,png}; do printf "\n* $x\n [[./$x]]"; done
