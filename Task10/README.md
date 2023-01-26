# DevOps_GL_Hometask: Docker

<hr>

## Task 1

### How to start first task:

Clone the repository to local storage:
``` 
git clone https://github.com/yurakorabel/DevOps_GL_Hometask.git
```

Go to the directory we need:
```
cd DevOps_GL_Hometask/Task10/Task1
```

Then build a new image with command:
```
sudo docker build -t nginx:latest .
```

![image](https://user-images.githubusercontent.com/55669434/214866371-c2b229a5-c629-4d63-a6dd-79a8ca3a671a.png)


Creating a Docker container with created image:
```
sudo docker run --name nginx -d -p 8080:80 nginx:latest
```

![image](https://user-images.githubusercontent.com/55669434/214866505-f53473f1-5cba-45e1-9748-cba2ef931266.png)


Cheking docker container:
```
sudo docker ps
```

![image](https://user-images.githubusercontent.com/55669434/214866637-28569f13-5c9f-4600-8601-f6700cd006ee.png)

### Result in Browser:

![image](https://user-images.githubusercontent.com/55669434/214867010-a0efdcf6-8d67-407d-8a1a-fd4549ea43d7.png)

<hr>

## Task 2

### How to start second task:

Clone the repository to local storage:
``` 
git clone https://github.com/yurakorabel/DevOps_GL_Hometask.git
```

Go to the directory we need:
```
cd DevOps_GL_Hometask/Task10/Task2
```

Then build a new image with command:
```
sudo docker build -t globallogic-ping:latest .
```
![image](https://user-images.githubusercontent.com/55669434/214877291-72c21f14-f2d5-411a-9eca-9a813f524511.png)

Creating public and private networks:
```
sudo docker network create public
```
![image](https://user-images.githubusercontent.com/55669434/214877769-1ee02c1e-36a1-46c4-a188-a2dc866a95f5.png)

```
sudo docker network create private --internal
```
![image](https://user-images.githubusercontent.com/55669434/214877889-fe78c23c-9833-4992-8767-48203993f64d.png)


Create two Docker containers:
```
sudo docker run --name public-ubuntu -d --network public globallogic-ping:latest
```
![image](https://user-images.githubusercontent.com/55669434/214878285-4ba38b21-6730-4ec3-a479-bc15e81ae66d.png)

```
sudo docker run --name private-ubuntu -d --network private globallogic-ping:latest
```
![image](https://user-images.githubusercontent.com/55669434/214878389-e01aae7c-1cf7-4b33-a051-34c6ebcc55ab.png)


Add a private network to the container:
```
sudo docker network connect private public-ubuntu
```



