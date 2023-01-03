#!/bin/bash

for i in {1..10}
do
  dd if=/dev/urandom of=file-$i bs=1M count=200
done