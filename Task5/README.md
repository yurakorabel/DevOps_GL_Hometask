# To get started, you'll need to install Terraform, Ansible and Git in your terminal. 

[how to install terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
 | 
[how to install git](https://www.digitalocean.com/community/tutorials/how-to-install-git-on-ubuntu-20-04)
 |
[how to install ansible](https://www.digitalocean.com/community/tutorials/how-to-install-git-on-ubuntu-20-04](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html))

<hr>

Start by updating the package list using the following command:
```
sudo apt update
```
<hr>

Use the following command to install pip for Python 3:
```
sudo apt install python3-pip
```

<hr>

Command to install Ansible:
```
sudo pip install ansible
```

<hr>

Clone the repository to local storage:
``` 
git clone https://github.com/yurakorabel/DevOps_GL_Hometask.git
```

<hr>

Go to the directory we need:
```
cd DevOps_GL_Hometask/Task5/terraform
```

<hr>

Command initializes a working directory containing Terraform configuration files:
```
terraform init 
```

<hr>

Command executes the actions proposed in a Terraform plan:
```
terraform apply -var username="enter your username"
```

<hr>

Now it remains to launch our playbook:
```
cd ../ansible
```

```
ansible-playbook playbook1.yaml
```

<hr>

We observe that the roles were performed successfully on all servers

![image](https://user-images.githubusercontent.com/55669434/209585861-a0a57d8a-03b6-4682-8d1a-6842a40ba753.png)

