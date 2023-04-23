#!/usr/bin/env groovy

pipeline {
    agent any
    environment {
        ANSIBLE_SERVER_IP = 170.64.182.106
    }

    stages {
        stage ("copying files to ansible server") {
            steps {
                script {
                    echo "copying files to ansible server"
                    sshagent(["ansible_server_credentials"]){
                        sh 'scp -o StrictHostKeyChecking=no ansible/* root@170.64.182.106:/root'
                        withCredentials([sshUserPrivateKey(credentialsId: 'ec2_server_credentials'), keyFileVariable: 'keyfile', usernameVariable: 'user']){
                            sh 'scp $keyfile root@$ANSIBLE_SERVER_IP:~/.ssh/ssh_private_key.pem'
                        }
                    }

                }
            }
        }
    }
}