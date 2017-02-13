# fioTest
fio multithreading Test
reahat7.1 fioTest
	1.上传安装包并解压
	  unzip fio.zip
	2 安装 fio每台
	  cd /root/fio

	  yum install fio fio-2.2.8-2.el7.x86_64.rpm

	3 安装 python threadpool每台

		1）有网安装

	    cd /usr/lib/python2.7/site-packages/

            easy_install threadpool

		2）无网安装

	    cd /usr/lib/python2.7/site-packages/
	   
	    easy_install threadpool-1.3.2-py2.7.egg

        4 运行脚本单台

	 python fioPerformanceTest.py 显示
	 python fioPerformanceTest.py > fio.txt 生产fio.txt文件

	4.远程运行脚本
	  chmod +x fio.sh
	  sh fio.sh 根据情况修改节点情况
	#!/bin/bash
	for i in {01..02};do  # fio检测节点顺序
    	    ssh node$i "cd /root/fio/;python fioPerformanceTest.py >fio$i.txt";
    	    ssh node$i "scp -r /root/fio/fio$i.txt  node01:/root/fio/";
    	    echo node$i;
    	    cat /root/fio/fio$i.txt;
	done

	for i in {02..02};do # 删除读取的节点，从第二个开始
    	    ssh node$i "rm -rf /root/fio/fio$i.txt";
	done

	  
