# To get started, you'll need to install Terraform and Git in your terminal. 

[how to install terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
 | 
[how to install git](https://www.digitalocean.com/community/tutorials/how-to-install-git-on-ubuntu-20-04)


<hr>

Clone the repository to local storage:
``` 
git clone https://github.com/yurakorabel/DevOps_GL_Hometask.git
```

Go to the directory we need:
```
cd DevOps_GL_Hometask/Task6
```

<hr>

Then you may need an ssh key in order to be able to connect to your own servers using the ssh protocol. 
Check if the "id_rsa" key exists in the "~/.ssh" directory. If not, you need to create one. [how to create shh key](https://www.digitalocean.com/community/tutorials/how-to-set-up-ssh-keys-on-ubuntu-20-04#step-1-creating-the-key-pair)

<hr>

Command initializes a working directory containing Terraform configuration files:
```
terraform init 
```

### Don't forget to enter your credentials in the [main.tf](https://github.com/yurakorabel/DevOps_GL_Hometask/blob/main/Task6/main.tf) file!!!
#### You can also change the configuration to custom in the [main.tf](https://github.com/yurakorabel/DevOps_GL_Hometask/blob/main/Task6/main.tf) file (at your own risk) 

Command creates an execution plan, which lets you preview the changes that Terraform plans to make to your infrastructure:
```
terraform plan
```

Command executes the actions proposed in a Terraform plan:
```
terraform apply
```

<hr>

An example of a successful launch:

![image](https://user-images.githubusercontent.com/55669434/210023219-a447663b-5275-4c56-90fc-b4a53301d89b.png)

<hr>

If you want to connect to the server via ssh:
```
ssh -i ~/.ssh/id_rsa ubuntu@"Enter Public IP AWS or Azure here"
```

To disconnect:
```
exit
```

<hr>

To view the server IP again, use the command:
```
terraform output
```

To conveniently destroy the entire infrastructure that we created on the clouds, you can use this command:
```
terraform destroy
```

<hr>

### Grafana webserver:

![image](https://user-images.githubusercontent.com/55669434/210023794-4067b746-163c-4023-bb63-377b420cf761.png)









