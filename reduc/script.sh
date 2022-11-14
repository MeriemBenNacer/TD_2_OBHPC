#!/bin/bash
sudo cpupower -c 2 frequency-set -g performance

make clean
make CC=clang

mkdir -p clang/clang3

taskset -c 2 ./reduc 100 100 > ./clang/clang3/clang3.txt



l=$( wc -l < ./clang/clang3/clang3.txt)


for (( i=2; i<=l; i++ ))
do 
    sed -n '1p;'"$i"'p' ./clang/clang3/clang3.txt  > ./clang/clang3/clang3_$i.txt
done

l=$((l-1 ))


tail -n $l ./clang/clang3/clang3.txt | cut -d";" -f1,12 > ./clang/clang3/clang3.dat

