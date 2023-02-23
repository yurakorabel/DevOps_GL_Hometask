# DevOps_GL_Hometask: Final Task

This project utilizes Terraform to create a Virtual Private Cloud (VPC) on either Google Cloud Platform (GCP), 
creates an instance with an external IP address, and prepares a managed MySQL database. 
Additionally, Ansible is used to perform basic hardening measures, such as keyless-only SSH, unattended upgrades, and firewall configuration. 
Optionally, the project includes hardening measures to achieve a CIS-CAT score of at least 80 (based on CIS-CAT Lite guidelines). 
The project also deploys a single-node Kubernetes cluster using Kubespray, 
and prepares an Ansible playbook for deploying WordPress with a connection to the managed MySQL database.

## What do you need to get started?

- Prior to beginning any work on the project, it is important to confirm that the 
sqladmin API, Cloud Resource Manager API, and Service Networking API have been enabled. 
If these resources have not been enabled, it will be necessary to navigate to the GCP website 
and enable them before proceeding with the project. Please ensure that these resources are enabled before starting work on the project.

- Your virtual machine must have an ssh key. If it doesn't exist, generate it using ssh-keygen command.

- Terraform must be installed. If it is not installed, go [HERE](https://developer.hashicorp.com/terraform/downloads) to install it.

- Ansible must also be installed. If you don't have it, go [HERE](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html).

- You must have Docker. If not, go [HERE](https://docs.docker.com/engine/install/ubuntu/) to install.

- In [custom-config.tf](https://github.com/yurakorabel/DevOps_GL_Hometask/blob/main/wordpress_deploy/custom-config.tf) you need to paste your settings:
  - Enter path to your credentials file (line 8)
  - Enter your project name (line 13)
  - Enter your linux username (line 24)
  - Enter host scr (line 27)

### Note 

If you want to make some changes to the project, you can also enter custom data into variables 
inside the [custom-config.tf](https://github.com/yurakorabel/DevOps_GL_Hometask/blob/main/wordpress_deploy/custom-config.tf) file.

## How to start?

To begin with, we need to clone this project to our local storage, from where we will launch it.
```
git clone https://github.com/yurakorabel/DevOps_GL_Hometask.git
```
Go to the directory of this project.
```
cd DevOps_GL_Hometask/wordpress_deploy
```
Initialize a Terraform working directory.
```
terraform init
```
Start a project
```
terraform apply --auto-approve
```

** Please be patient as this project will take up to 50 minutes to run

Result in console:

![image](https://user-images.githubusercontent.com/55669434/220906865-72979d68-3a2b-4acd-a2c3-faa9f102b77a.png)

Go to [Free Domain](https://dynv6.com/) and add the server IP to the domain name we use for this project.

![image](https://user-images.githubusercontent.com/55669434/220907983-ea035a30-007b-4d36-910c-3da5f7486de7.png)

Go to our website and configure WordPress

![image](https://user-images.githubusercontent.com/55669434/220909003-8370fa94-15dd-41bb-a042-1755aa019f3c.png)