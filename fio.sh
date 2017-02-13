#!/bin/bash
for i in {01..02};do
    ssh node$i "cd /root/fio/;python fioPerformanceTest.py >fio$i.txt";
    ssh node$i "scp -r /root/fio/fio$i.txt  node01:/root/fio/";
    echo node$i;
    cat /root/fio/fio$i.txt;
done

for i in {02..02};do
    ssh node$i "rm -rf /root/fio/fio$i.txt";
done
