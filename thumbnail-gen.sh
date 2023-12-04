#!/usr/bin/env bash

(for x in *.{jpg,png}; do echo "* $x\n [[./$x]]"; done) > README.org
