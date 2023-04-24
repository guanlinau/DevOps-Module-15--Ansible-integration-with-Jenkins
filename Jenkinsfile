#!/usr/bin/env groovy

pipeline {
    agent any
    environment {
        ANSIBLE_SERVER_IP = "170.64.182.106"
    }

    stages {
        stage ("copying files to ansible server") {
            steps {
                script {
                    echo "copying files to ansible server"
                    sshagent(["ansible_server_credentials"]){
                        sh 'scp -o StrictHostKeyChecking=no ansible/* root@${ANSIBLE_SERVER_IP}:/root'
                        sh 'scp -o StrictHostKeyChecking=no prepare_ansible_server.sh root@${ANSIBLE_SERVER_IP}:/root'

                        withCredentials([sshUserPrivateKey(credentialsId: 'ec2_server_credentials', keyFileVariable: 'keyfile', usernameVariable: 'user')]){
                            sh 'scp ${keyfile} root@${ANSIBLE_SERVER_IP}:~/.ssh/ssh_private_key'
                        }
                    }

                }
            }
        }
        stage("Executing ansible playbook") {
            steps {
                //  Method 1
                script {
                    def installCMD = 'bash prepare_ansible_server.sh'
                    def runAnsible ='ansible-playbook ansible.yaml'
                    sshagent(["ansible_server_credentials"]){
                        sh "ssh -o StrictHostKeyChecking=no root@${ANSIBLE_SERVER_IP} ${installCMD}  ${runAnsible}"
                    }

                }
                //  method 2 : using ssh pipeline step
                // script {
                //     def remote = [:]
                //     remote.name = 'ubuntu-ansible-server-s-2vcpu-4gb-intel-syd1-01'
                //     remote.host = ANSIBLE_SERVER_IP
                //     remote.allowAnyHosts = true

                //     withCredentials([sshUserPrivateKey(credentialsId: 'ansible_server_credentials', keyFileVariable: 'keyFile', usernameVariable: 'user')]) {
                //         remote.user = user
                //         remote.identityFile = keyFile
                //         sshCommand remote: remote, command: "ansible-playbook ansible.yaml"
                //     }
                // }
            }
        }
    }

}