### Project:

Ansible Integration in Jenkins

### Technologies used:

Ansible, Jenkins, DigitalOcean, AWS, Boto3, Docker, Java, Maven, Linux, Git

### Project Description:

1- Create and configure a dedicated server for Jenkins

2- Create and configure a dedicated server for Ansible Control Node

3- Write Ansible Playbook, which configures 2 EC2 Instances

4- Add ssh key file credentials in Jenkins for Ansible Control Node server and Ansible Managed Node servers

5- Configure Jenkins to execute the Ansible Playbook on remote Ansible Control Node server as part of the CI/CD pipeline

6- So the Jenkinsfile configuration will do the following:

a. Connect to the remote Ansible Control Node server

b. Copy Ansible playbook and configuration files to the remote Ansible Control Node server

c. Copy the ssh keys for the Ansible Managed Node servers to the Ansible Control Node server d. Install Ansible, Python3 and Boto3 on the Ansible Control Node server

e. With everything installed and copied to the remote Ansible Control Node server, execute the
playbook remotely on that Control Node that will configure the 2 EC2 Managed Nodes

### Usage instruction

###### Step1 : Create ansible and jenkins server

#Ansible server
![image](images/Screenshot%202023-04-29%20at%203.10.57%20pm.png)

#Jenkins server
![image](images/Screenshot%202023-04-29%20at%203.11.43%20pm.png)

![image](images/Screenshot%202023-04-29%20at%203.12.37%20pm.png)

###### Step2: Create two ec2 instances via terraform

```
vpc_cidr_block =
subnet_cidr_block =
availability_zone =
env_profix =
my_ip_address =
ansible_server_ip_address=
instance_type =
public_key_location  =
ssh_private_key_location =
server_user =
instance_number =

```

#Add local computer ip address into variable "my_ip_address"
#Add ansible server ip address into variable "ansible_server_ip_address"

```
cd terraform_ec2_instance
```

```
terraform apply --auto-approve
```

###### Step 3: Create inventory plugin to get the running ec2 server's public domain name address

![image](images/Screenshot%202023-04-29%20at%204.36.00%20pm.png)

###### Step 4: Create ansible.yaml and execute it

###### Step 5: Build the pipeline

#Using SSH-Agent plugin
![image](images/Screenshot%202023-04-24%20at%2011.36.27%20am.png)

#Using SSH pipeline step plugin
![images](images/Screenshot%202023-04-29%20at%204.13.09%20pm.png)
![images](images/Screenshot%202023-04-29%20at%204.13.22%20pm.png)
