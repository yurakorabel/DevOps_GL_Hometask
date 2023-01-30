# DevOps_GL_Hometask: Setup Kubernetes

<hr>

Prepare 2 VMs (kubemaster and kubenode) with the same parametrs

### Requirements:
- 4 CPU
- 8 GB RAM
- Ubuntu

![image](https://user-images.githubusercontent.com/55669434/215529019-d958e7f9-fcaa-44f5-94f1-919c320c3aa2.png)
![image](https://user-images.githubusercontent.com/55669434/215528751-7a2a4055-5917-4e5d-9419-84f8919e46ec.png)

<hr>

## You need to run these commands in two VMs:
```
sudo apt update
```
```
sudo apt upgrade -y
```
Edit the hosts file with the command:
```
sudo vi /etc/hosts
```
Put your private IP address and hostname

![image](https://user-images.githubusercontent.com/55669434/215537889-f499d635-f438-4f2c-983e-77c82bc3ed3a.png)

Install the first dependencies with:
```
sudo apt install curl apt-transport-https -y
```
Next, add the necessary GPG key with the command:
```
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
```
Add the Kubernetes repository with:
```
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
```
Update apt:
```
sudo apt update
```
Install the required software with the command:
```
sudo apt -y install vim git curl wget kubelet kubeadm kubectl
```
Place kubelet, kubeadm, and kubectl on hold with:
```
sudo apt-mark hold kubelet kubeadm kubectl
```
Start and enable the kubelet service with:
```
sudo systemctl enable --now kubelet
```
Next, we need to disable swap on both kubemaster. Open the fstab file for editing with:
```
sudo vi /etc/fstab
```
Save and close the file. You can either reboot to disable swap or simply issue the following command to finish up the job:
```
sudo swapoff -a
```
Enable Kernel Modules and Change Settings in sysctl:
```
sudo modprobe overlay
```
```
sudo modprobe br_netfilter
```
Change the sysctl settings by opening the necessary file with the command:
```
sudo vi /etc/sysctl.d/kubernetes.conf
```
Look for the following lines and make sure they are set as you see below:
```
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.ip_forward = 1
```
Save and close the file. Reload sysctl with:
```
sudo sysctl --system
```
### Install containerd

Install the necessary dependencies with:
```
sudo apt install curl gnupg2 software-properties-common apt-transport-https ca-certificates -y
```
Add the GPG key with:
```
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```
Add the required repository with:
```
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
```
Install containerd with the commands:
```
sudo apt update
```
```
sudo apt install containerd.io -y
```
Change to the root user with:
```
sudo su
```
Create a new directory for containerd with:
```
mkdir -p /etc/containerd
```
Generate the configuration file with:
```
containerd config default>/etc/containerd/config.toml
```
Exit from the root user with:
```
exit
```
Restart containerd with the command:
```
sudo systemctl restart containerd
```
Enable containerd to run at startup with:
```
sudo systemctl enable containerd
```
### Initialize the Master Node

Pull down the necessary container images with:
```
sudo kubeadm config images pull
```

<hr>

## You need to run these commands only in kubemaster:

Now, using the kubemaster IP address initialize the master node with:
```
sudo kubeadm init --pod-network-cidr=192.168.0.0/16
```
### Result:

![image](https://user-images.githubusercontent.com/55669434/215546453-0ee9e49d-c6c7-4665-9b00-98102063dfae.png)

Finally, you need to create a new directory to house a configuration file and give it the proper permissions which is done with the following commands:
```
mkdir -p $HOME/.kube
```
```
sudo cp -f /etc/kubernetes/admin.conf $HOME/.kube/config
```
```
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```
List Kubernetes Nodes:
```
kubectl get nodes
```
![image](https://user-images.githubusercontent.com/55669434/215547569-ed0492c1-5ef7-432e-a452-0f255a407961.png)

<hr>

## You need to run these commands only in the kubenode:

Connect kubenode to kubemaster
```
sudo su
```
Copy from kubemaster output
```
kubeadm join 10.132.0.9:6443 --token ut36yh.qd0aeqwaciay05l6         
--discovery-token-ca-cert-hash 
sha256:11111111111111111111111111111111111111111111111111111111111111
```

<hr>

## You need to run these commands only in the kubemaster:

Install network:
```
kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.25.0/manifests/tigera-operator.yaml
```
```
curl https://raw.githubusercontent.com/projectcalico/calico/v3.25.0/manifests/custom-resources.yaml -O
```
```
kubectl create -f custom-resources.yaml
```
Wait when all pods will be ready:
```
kubectl get pods --all-namespaces -w
```
![image](https://user-images.githubusercontent.com/55669434/215550623-5be4b250-ed95-4ac2-a779-c3b8eb46b814.png)

### Result:
```
kubectl get nodes -o wide
```
![image](https://user-images.githubusercontent.com/55669434/215550922-9760ba5f-4e59-46fd-a077-53d89d1a5490.png)

<hr>

## Successfully deployed Kubernetes

