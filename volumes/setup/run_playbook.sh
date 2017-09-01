#!/bin/sh

ansible-playbook /usr/share/ansible/openshift-ansible/playbooks/byo/config.yml | tee ansible-run-`date +%Y%m%d%H%M%S`.log
