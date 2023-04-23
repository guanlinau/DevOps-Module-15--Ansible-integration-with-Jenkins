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
