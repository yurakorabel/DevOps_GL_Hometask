# DevOps_GL_Hometask: k8s part 2

In this task, we create a cluster in Kubernetes with kubespray. In order to create a cluster, we used the step-by-step instructions from the previous task.

[Instruction](https://github.com/yurakorabel/DevOps_GL_Hometask/tree/main/Task11) - how to create k8s cluster

<hr>

## How to start? 

To begin with, we will need to create an instance on which we will create a cluster

![image](https://user-images.githubusercontent.com/55669434/217299289-b84cd129-b7f0-455f-9954-903acc5e741b.png)

![image](https://user-images.githubusercontent.com/55669434/217302857-9de1d30c-754f-41eb-bfce-7b7212e59325.png)

![image](https://user-images.githubusercontent.com/55669434/217304186-f0f01fb5-f97a-4733-bcaf-6c6f604f0114.png)

<hr>

### To configure Kubernetes, we need to run these commands on our virtual machine

You need to clone the repository with kubespray:
```
git clone https://github.com/kubernetes-sigs/kubespray.git
```
```
cd kubespray
```
```
git checkout release-2.20
```

You need to copy and edit the inventory file
```
cp -rfp inventory/sample inventory/mycluster
```
```
vi inventory/mycluster/inventory.ini
```

Paste
```
[all]
node1 ansible_host=your_public_ip

[kube_control_plane]
node1

[etcd]
node1

[kube_node]
node1

[calico_rr]

[k8s_cluster:children]
kube_control_plane
kube_node
calico_rr
```

Turn on MetaLB
```
vi inventory/mycluster/group_vars/k8s_cluster/addons.yml
```

Paste
```
metallb_enabled: true
metallb_speaker_enabled: true
metallb_avoid_buggy_ips: true
metallb_ip_range:
  - "VM_private_ip/32"
```

```
vim inventory/mycluster/group_vars/k8s_cluster/k8s-cluster.yml
```

Paste
```
kube_proxy_strict_arp: true
```

### Docker

#### Note: before run commands you must install Docker !

```
sudo docker run --rm -it -v ~/kubespray:/mnt/kubespray  -v ~/.ssh:/pem  quay.io/kubespray/kubespray:v2.20.0 bash
```

Now you need to go to the kubespray directory and run the playbook(you need to enter your user in this command):
```
ansible-playbook -i inventory/mycluster/inventory.ini --private-key /pem/id_rsa -e ansible_user=remote_user -b cluster.yml
```

![image](https://user-images.githubusercontent.com/55669434/217309392-cda7f741-42fa-4bd1-bde4-0b4819390d3f.png)

Connect to our vm:
```
ssh -i /pem/id_rsa your_user@your_ip
```
```
mkdir ~/.kube
```
```
sudo cp /etc/kubernetes/admin.conf ~/.kube/config
```
```
sudo chmod 777 ~/.kube/config
```
```
kubectl get nodes
```

Nodes:
```
kubectl get nodes
```

![image](https://user-images.githubusercontent.com/55669434/217310797-b2861af4-716a-4baa-a7d6-b0fd075ce209.png)

Clone the project:
```
git clone https://github.com/yurakorabel/DevOps_GL_Hometask/tree/main/Task13.git
```
```
cd DevOps_GL_Hometask/Task13/
```

Apply ingress controller:
```
kubectl apply -f nginx-ctl.yaml
```
```
kubectl apply -f path_provisioner.yaml
```

List of pods:
```
kubectl get pods -n ingress-nginx -w
```

![image](https://user-images.githubusercontent.com/55669434/217312424-53babbb1-72ed-4159-a388-34d60f4e5877.png)

List of services:
```
kubectl get svc --all-namespaces
```

![image](https://user-images.githubusercontent.com/55669434/217312704-4870c833-f121-4ea6-b55c-f2ca7aeb3078.png)

### Domain

[domain site](https://dynv6.com/)

![image](https://user-images.githubusercontent.com/55669434/217312847-5d0689d2-040b-4ae2-a5ce-f173a8aebbf9.png)

### Deployment

Before using the following commands, you should change the data in the file to your own
```
kubectl apply -f deployment.yaml
```

List of pods:
```
kubectl get pods
```

![image](https://user-images.githubusercontent.com/55669434/217313538-b15c0629-35a4-4bd9-8fe4-44863d68d442.png)

### Certificate

Installing cert-manager:
```
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.11.0/cert-manager.yaml
```

```
kubectl apply -f staging-issuer.yaml
```
```
kubectl apply -f production-issuer.yaml
```

```
kubectl get certificate
```

![image](https://user-images.githubusercontent.com/55669434/217314603-4575e990-0246-4cfc-9d01-dee845f1aff8.png)

### Result

![image](https://user-images.githubusercontent.com/55669434/217314883-b4e5a88f-8333-41fb-b5cc-63e7f18abc57.png)









