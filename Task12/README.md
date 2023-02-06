# DevOps_GL_Hometask: k8s part 1

In this task, we use a cluster in Kubernetes. In order to create a cluster, we used the step-by-step instructions from the previous task.

[Instruction](https://github.com/yurakorabel/DevOps_GL_Hometask/tree/main/Task11) - how to create k8s cluster

<hr>

## How to start? 
To import this project, use these git commands:
```
git clone https://github.com/yurakorabel/DevOps_GL_Hometask/tree/main/Task12
```
```
cd DevOps_GL_Hometask/Task12
```

<hr>

### To begin, insert your external IP address into the [curl_external.yaml](https://github.com/yurakorabel/DevOps_GL_Hometask/blob/main/Task12/curl_external.yaml) file

<hr>

### Get information about your worker node and save it in some file
With this command, you will get a description of the node:
```
kubectl describe node kubenode
```
Save the description in a separate file [worker_node_info.txt:](https://github.com/yurakorabel/DevOps_GL_Hometask/blob/main/Task12/worker_node_info.txt)
```
echo "$(kubectl describe node kubenode)" > worker_node_info.txt
```

<hr>

### Create a new namespace (all resources below will create in this namespace)

Create a new namespace:
```
kubectl create ns kube-task
```
![image](https://user-images.githubusercontent.com/55669434/217038003-b85824f6-f200-48b5-adc3-74b36f5363ee.png)


All namespaces:
```
kubectl get ns
```
![image](https://user-images.githubusercontent.com/55669434/217038133-6c5845d7-c489-4ff2-8519-abf7e1409bb5.png)

<hr>

### Deployment and Service
This command will run all yaml files in the directory and create resources in this namespace
```
kubectl apply -n kube-task -f ./
```
![image](https://user-images.githubusercontent.com/55669434/217039373-6d77ba0d-c0ef-44f0-b822-b44db336a7cc.png)

With this command you will get a list of deployments in a specific namespace:
```
kubectl get deploy -n kube-task
```
![image](https://user-images.githubusercontent.com/55669434/217040439-0d0ee3cf-59b0-4ac0-a6b4-bcb6c2156d46.png)

With this command you will get a list of pods in a specific namespace:
```
kubectl get pods -n kube-task
```
![image](https://user-images.githubusercontent.com/55669434/217040712-9d94b419-9728-47b1-8f2b-2a1806643702.png)

With this command, you will get a list of services in a specific namespace:
```
kubectl get svc -n kube-task
```
![image](https://user-images.githubusercontent.com/55669434/217040955-20d59b8c-e728-48aa-adae-f1540b30e142.png)

With this command, you will get a description of the deployment in a specific namespace:
```
kubectl describe deploy apache-service -n kube-task
```
![image](https://user-images.githubusercontent.com/55669434/217041675-3c8b0f9b-f3c9-4ebe-a5f9-04097238d081.png)

With this command you will get a description of the pod in a specific namespace:
```
kubectl describe pods apache-service-56bf494c78-49g8b -n kube-task
```
![image](https://user-images.githubusercontent.com/55669434/217042556-87e779b3-a8f2-4006-8e45-4a470b9cb7cb.png)

With the help of this command, you will get a description of the service in a specific namespace:
```
kubectl describe svc clusterip -n kube-task
```
![image](https://user-images.githubusercontent.com/55669434/217042850-38ba9faa-9d3e-44de-b009-b888241adfe1.png)

With the help of this command, you will get a description of the service in a specific namespace:
```
kubectl describe svc nodeport -n kube-task
```
![image](https://user-images.githubusercontent.com/55669434/217043276-58fa5afd-a983-4cbc-b7e2-c9a4d2aa9a95.png)

With the help of this command, you will get a log of the pod in a specific namespace:
```
kubectl logs apache-service-56bf494c78-49g8b -n kube-task
```
![image](https://user-images.githubusercontent.com/55669434/217043503-d1e4ca39-c448-451a-a64c-bff4bd306cca.png)

<hr>

### Jobs
With this command you will get a list of jobs in a specific namespace:
```
kubectl get job -n kube-task
```
![image](https://user-images.githubusercontent.com/55669434/217045478-a2761a27-8ee6-40a1-aa09-80395384d98e.png)

With the help of this command, you will get a log of the job in a specific namespace:
```
kubectl logs job/job-curl-clusterip -n kube-task
```
![image](https://user-images.githubusercontent.com/55669434/217045743-04f4f5c0-a74a-44be-841e-76c05c0e1e63.png)

With the help of this command, you will get a description of the job in a specific namespace:
```
kubectl describe job job-curl-clusterip -n kube-task
```
![image](https://user-images.githubusercontent.com/55669434/217046042-a710ccd7-2534-497a-ac79-2399f9163adc.png)

With the help of this command, you will get a log of the job in a specific namespace:
```
kubectl logs job/job-curl-nodeport -n kube-task
```
![image](https://user-images.githubusercontent.com/55669434/217046264-32eae325-f9a0-4dab-9da8-ef1bb538a373.png)

With the help of this command, you will get a description of the job in a specific namespace:
```
kubectl describe job job-curl-nodeport -n kube-task
```
![image](https://user-images.githubusercontent.com/55669434/217046423-b1ac5aac-5db5-4c5f-a615-d95aef47c897.png)

<hr>

### CronJob
With this command you will get a list of cronjob in a specific namespace:
```
kubectl get cj -n kube-task
```
![image](https://user-images.githubusercontent.com/55669434/217046639-8a203cfa-4782-46db-b60a-81e050151131.png)

With the help of this command, you will get a list of job created by cronjob in a certain namespace:
```
kubectl get job -n kube-task
```
![image](https://user-images.githubusercontent.com/55669434/217046778-68be126b-22fb-40c2-8318-886603642162.png)

With the help of this command, you will get a log of job created by cronjob in a specific namespace:
```
kubectl logs job/cronjob-test-connection-27928422 -n kube-task
```
![image](https://user-images.githubusercontent.com/55669434/217047040-afb5e11e-277d-4334-b3d0-31395e1fe60c.png)

With the help of this command, you will get a description of the cronjob in a specific namespace:
```
kubectl describe cj cronjob -n kube-task
```
![image](https://user-images.githubusercontent.com/55669434/217047167-bbe006dc-9d64-4934-aedd-6c177bf2583a.png)

