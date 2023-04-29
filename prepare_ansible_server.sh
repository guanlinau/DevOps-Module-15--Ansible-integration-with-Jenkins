#!/usr/bin/env bash

apt update

apt install ansible -y
apt install python3-pip -y

pip3 install boto3 botocore


# Define the configuration file
CONFIG_FILE="/etc/ssh/sshd_config"

# Define the new configuration line
NEW_LINE="PubkeyAcceptedAlgorithms +ssh-rsa"

# Check if the configuration line already exists
if grep -q "^$NEW_LINE" "$CONFIG_FILE"; 
then
    echo "The configuration line already exists in $CONFIG_FILE."
else
    # Add the new configuration line to the configuration file
    echo "$NEW_LINE" | sudo tee -a "$CONFIG_FILE"
    echo "The configuration line has been added to $CONFIG_FILE."
fi

# Restart the SSH service to apply the changes
sudo systemctl restart sshd