#!/bin/sh


ansible masters[0] -m shell -a "oadm policy add-cluster-role-to-user cluster-admin ocadmin"

#vim: ts=4 et
