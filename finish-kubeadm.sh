


mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

cat <<EOF > /etc/profile.d/kube.sh
export KUBECONFIG=/etc/kubernetes/admin.conf
EOF



cat <<EOF >> /etc/hosts
199.232.68.133  raw.githubusercontent.com
EOF
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
