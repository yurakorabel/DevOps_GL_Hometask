# To get started, you'll need to install Ansible and Git in your terminal. 

[how to install git](https://www.digitalocean.com/community/tutorials/how-to-install-git-on-ubuntu-20-04)
 |
[how to install ansible](https://www.digitalocean.com/community/tutorials/how-to-install-git-on-ubuntu-20-04](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html))

<hr>

Start by updating the package list using the following command:
```
sudo apt update
```

Use the following command to install pip for Python 3:
```
sudo apt install python3-pip
```

Command to install Ansible:
```
sudo pip install ansible
```

<hr>

Clone the repository to local storage:
``` 
git clone https://github.com/yurakorabel/DevOps_GL_Hometask.git
```

Go to the directory we need:
```
cd DevOps_GL_Hometask/Task7-8
```

<hr>

To join the server, you need to enter your username and password or ssh key in the [pam_hardening_servers](https://github.com/yurakorabel/DevOps_GL_Hometask/blob/main/Task7-8/group_vars/pam_hardening_servers) file

![image](https://user-images.githubusercontent.com/55669434/212769972-1048b84c-3d99-4ac4-af03-620115c4971a.png)

If you want to configure the server on which you run the ansible playbook, then you should not change anything else.

Otherwise, enter the server IP in the [hosts.cfg](https://github.com/yurakorabel/DevOps_GL_Hometask/blob/main/Task7-8/hosts.cfg) file instead of 127.0.0.1

![image](https://user-images.githubusercontent.com/55669434/212770561-9abec9ef-edd6-4c9e-ac84-fd07a35eb451.png)

<hr>

Now it remains to launch our playbook:
```
ansible-playbook playbook.yml
```

<hr>

We can observe when the playbook is successfully launched

![image](https://user-images.githubusercontent.com/55669434/212770772-0030bb13-8b25-4b82-b766-be41164cbd24.png)

<hr>

Hardening check:

![image](https://user-images.githubusercontent.com/55669434/212770962-56b43466-7e7d-4bf9-9d58-712e84dba963.png)

![image](https://user-images.githubusercontent.com/55669434/212771215-7f744c2d-ea88-4998-852b-0fd284916c51.png)

