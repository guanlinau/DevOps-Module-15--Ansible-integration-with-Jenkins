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
                //  Method 1
                // script {
                //     sshagent(["ansible_server_credentials"]){
                //         sh 'ssh -o StrictHostKeyChecking=no root@${ANSIBLE_SERVER_IP} ansible-playbook ansible.yaml'
                //     }

                // }
                //  method 2 : using ssh pipeline step
                script {
                    def remote = [:]
                    remote.name = 'ansible_server'
                    remote.hosts = ${ANSIBLE_SERVER_IP}
                    remote.allowAnyHots = true

                    withCredentials([sshUserPrivateKey(credentialsId:'ansible_server_credentials', keyFileVariable:'keyFile', passphraseVariable: '',usernameVariable: 'userName')]){
                        remote.user = userName
                        remote.identifyFile = keyFile
                        sshCommand remote: remote, command: "ansible-playbook ansible.yaml"

                }
                }
            }
        }
    }

}