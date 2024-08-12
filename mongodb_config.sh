#!/bin/bash
# edit limits
echo -e "\n* soft nproc 262140\n* hard nproc 262140\n* soft nofile 262140\n* hard nofile 262140\nroot soft nofile 26
2140\nroot hard nofile 262140\nroot soft nproc 262140\nroot hard nproc 262140" >> /etc/security/limits.conf 

ulimit -n 262140
echo "vm.swappiness=1" >> /etc/sysctl.conf
