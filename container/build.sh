#!/bin/bash

cd /root/sedutil
autoreconf --install
./configure
make all