#!/bin/sh

ansible nodes -b -m shell -a "subscription-manager repos --disable=*"
ansible nodes -b -m shell -a "subscription-manager repos --enable=rhel-7-server-rpms --enable=rhel-7-server-extras-rpms --enable=rhel-7-server-optional-rpms --enable=rhel-7-server-satellite-tools-6.2-rpms --enable=rhel-7-server-ose-3.2-rpms; yum clean all"

ansible nodes -b -m shell -a "yum update -y atomic-openshift-utils"
ansible nodes -b -m shell -a "yum -y install atomic-openshift-excluder atomic-openshift-docker-excluder"
ansible nodes -b -m shell -a "atomic-openshift-excluder exclude"
ansible nodes -b -m shell -a "atomic-openshift-docker-excluder exclude"
ansible nodes -b -m shell -a "atomic-openshift-excluder unexclude"

ansible-playbook -b /usr/share/ansible/openshift-ansible/playbooks/byo/openshift-cluster/upgrades/v3_2/upgrade.yml --extra-vars "openshift_release=v3.2 openshift_image_tag=v3.2.1.31" | tee upgrade.log

ansible nodes -b -m shell -a "atomic-openshift-excluder exclude"

ansible nodes -b -m shell -a "reboot"
