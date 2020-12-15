#!/bin/sh
set -e
d=$(date '+%Y.%m.%d_%H:%M')

# if ssh access to servers only with password, then
# install sshpass on all nodes and add `-k` options 

export ANSIBLE_LOG_PATH=./deploy-$d.log
#ansible-playbook -u "$1" -i inventory/mycluster/inventory.ini cluster.yml -b --diff
ansible-playbook -u "$1" -i inventory/mycluster/hosts.yml --become --become-user=root cluster.yml -b --diff
exit 0