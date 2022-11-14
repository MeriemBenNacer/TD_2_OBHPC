#!/bin/bash
sudo cpupower -c 2 frequency-set -g performance

make clean
make CC=gcc

mkdir -p gcc/gcc3

taskset -c 2 ./dgemm 100 100 > ./gcc/gcc3/gcc3.txt



l=$( wc -l < ./gcc/gcc3/gcc3.txt)


for (( i=2; i<=l; i++ ))
do 
    sed -n '1p;'"$i"'p' ./gcc/gcc3/gcc3.txt  > ./gcc/gcc3/gcc3_$i.txt
done

l=$((l-1 ))


tail -n $l ./gcc/gcc3/gcc3.txt | cut -d";" -f1,11 > ./gcc/gcc3/gcc3.dat

