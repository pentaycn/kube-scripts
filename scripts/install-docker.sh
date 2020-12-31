#! /bin/bash

yum install -y yum-utils device-mapper-persistent-data lvm2
yum install -y https://mirrors.aliyun.com/docker-ce/linux/centos/8/x86_64/stable/Packages/containerd.io-1.4.3-3.1.el8.x86_64.rpm
yum-config-manager --add-repo https://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
yum makecache
yum install -y docker-ce-3:19.03.9-3.el7
mkdir /etc/docker
cat <<EOF > /etc/docker/daemon.json
{
  "registry-mirrors": ["https://a5agyt8o.mirror.aliyuncs.com"],
  "exec-opts": ["native.cgroupdriver=systemd"]
}
EOF
systemctl restart docker
systemctl enable docker
