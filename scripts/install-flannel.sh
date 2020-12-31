cat <<EOF >> /etc/hosts

199.232.68.133  raw.githubusercontent.com
EOF
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
