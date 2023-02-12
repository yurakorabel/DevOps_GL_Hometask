# DevOps_GL_Hometask: Helm Home Task

This task involves deploying Nginx with Ingress configuration via Helm, changing parameters with "helm upgrade --install --atomic," creating and deploying a custom Pacman chart, and deploying a MERN stack (MongoDB, Express, React, and Node) via Helm.

[Instruction](https://github.com/yurakorabel/DevOps_GL_Hometask/tree/main/Task11) - how to create k8s cluster

or

[Instruction](https://github.com/yurakorabel/DevOps_GL_Hometask/tree/main/Task13) - how to create k8s cluster (using kubespray)

### Before starting, you need to modify the values.yaml file to suit yourself !!!

<hr>

## How to start? 

To import this project, use these git commands:
```
git clone https://github.com/yurakorabel/DevOps_GL_Hometask.git
```
```
cd DevOps_GL_Hometask/Task14
```

Need to install Helm
```
sudo snap install helm --classic
```

<hr>

### Task 1

Deploy Nginx using Helm with Ingress configuration, set variables in value YAML, and change parameters with "helm upgrade --install --atomic."

This command will run the helm chart:
```
helm install nginx-via-helm nginx/
```
![image](https://user-images.githubusercontent.com/55669434/218340839-3b05ebf5-9cc7-4a3a-943b-ad9267443ee4.png)

This command show all resources that have been created:
```
kubectl get all
```
![image](https://user-images.githubusercontent.com/55669434/218341153-dfd2f437-8dd8-4ef0-9c99-7859ab989517.png)

With this command, you can change some parameters:
```
helm upgrade --install --atomic nginx-via-helm nginx/ --set replicaCount=4
```
![image](https://user-images.githubusercontent.com/55669434/218341183-4df3888d-fa5f-4beb-baed-a1aca41ce84e.png)

Result:

![image](https://user-images.githubusercontent.com/55669434/218341200-d8ec8db9-c77e-4184-9ed2-3f8f7db03088.png)

### [Website](http://yurakorabel.dynv6.net/nginx-via-helm):

![image](https://user-images.githubusercontent.com/55669434/218341361-672ec245-0408-4805-b0b2-ae3470ea36a2.png)

<hr>

### Task 2

Create and deploy a custom chart for the Pacman game on a Kubernetes cluster using Helm.

This command will run the helm chart:
```
helm install pacman-game pacman-game/
```
![image](https://user-images.githubusercontent.com/55669434/218341831-99b7bbe5-0420-47e2-b906-33068ad1b22f.png)

### [Website](http://yurakorabel.dynv6.net/):

![image](https://user-images.githubusercontent.com/55669434/218341651-0785f121-f50c-4599-9fff-9158d864bae0.png)

<hr>

### Task 3

Deploy the MERN stack (MongoDB, Express.js, React.js, Node.js) using Helm on a Kubernetes cluster.

This command Add the bitnami charts repository to Helm:
```
helm repo add bitnami https://charts.bitnami.com/bitnami
```

Deploy MongoDB:
```
helm install mongodb bitnami/mongodb
```

Deploy Express.js:
```
helm install express-app bitnami/node
```

Deploy React.js:
```
helm install react-app bitnami/node
```

Apply ingress:
```
kubectl apply -f mern/ingress.yaml
```

### [MongoDB](http://yurakorabel.dynv6.net/mongodb):

![image](https://user-images.githubusercontent.com/55669434/218342330-f6235101-b0aa-488c-8067-2ceb0b8e31c7.png)

### [Express.js](http://yurakorabel.dynv6.net/express):

![image](https://user-images.githubusercontent.com/55669434/218342401-3017b304-65c1-42c9-8f45-b0f33753b21f.png)

### [React.js](http://yurakorabel.dynv6.net/react):

![image](https://user-images.githubusercontent.com/55669434/218342434-645010d5-0497-498a-8c66-16c3789007d4.png)

<hr>

In conclusion, the task involves deploying various applications on a Kubernetes cluster using Helm, including Nginx, a custom chart for the Pacman game, and the MERN stack. It highlights the benefits of using Helm in deployment and management of applications.







