#!/bin/bash

# Update Package Lists
apt update

# # Install Ansible
apt install -y ansible

# Run the Ansible playbook
ansible-playbook /root/postinstall/playbook.yml --connection=local

# Disable and remove the onetime setup systemd service
systemctl disable postinstall.service
rm -f /etc/systemd/system/postinstall.service
rm -rf /root/postinstall

# Log Completion
echo "Post-install setup completed at $(date)" | tee -a /root/postinstall.log
