#!/bin/bash
kill $( ps aux | grep /media/liubowen/wimdow/Program\ Files\ \(x86\)/wallproxy-0095b8ccc367/local/startup.py  | awk '{print $2}')

python /media/liubowen/windows/Program\ Files\ \(x86\)/wallproxy-0095b8ccc367/local/startup.py  
