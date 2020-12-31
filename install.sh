#! /bin/bash

yum install -y epel-release
yum install -y sshpass

ssh-keygen -t rsa -P "" -f ~/.ssh/id_rsa

cmmd="cd /root/.scripts && \
	bash centos8.sh && \
	bash sethosts.sh && \
	bash install-docker.sh && \
	bash images-pull.sh && \
	bash pretreat.sh && \
	bash install-k8s.sh
	"

awk '{print $1" "$2}' hosts.txt > scripts/hosts.txt
cat hosts.txt | while read ipaddr hostname passwd
do
    sshpass -p $passwd ssh-copy-id -o stricthostkeychecking=no $ipaddr
    scp -r scripts root@$ipaddr:/root/.scripts
    ssh -n root@$ipaddr "$cmmd"
done
