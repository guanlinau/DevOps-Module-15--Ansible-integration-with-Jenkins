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

                        withCredentials([sshUserPrivateKey(credentialsId: 'ec2_server_credentials', keyFileVariable: 'keyfile', usernameVariable: 'user')]){
                            sh 'scp ${keyfile} root@${ANSIBLE_SERVER_IP}:~/.ssh/ssh_private_key'
                        }
                    }

                }
            }
        }
        stage("Executing ansible playbook") {
            steps {
                script {
                    sshagent(["ansible_server_credentials"]){
                        sh 'ssh -o StrictHostKeyChecking=no root@${ANSIBLE_SERVER_IP} ansible-inventory -i inventory_aws_ec2.yaml --graph'
                    }

                }
            }
        }
    }

}