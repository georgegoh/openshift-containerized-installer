OpenShift 3.2 installer
=======================

This repository contains the artifacts for creating a docker image to automate
OSE installation.

# How to run

This docker image was designed to retrieve its ansible configuration from an
external volume, i.e., **$(pwd)/volumes-{hive,internet,intranet}/{ansible,custom-certs,pre-setup,setup,post-setup}**. 
This allows the user to modify the most parameters without needing to rebuild
the image when running/re-running the installation.

Before running, visit each of the subdirectories under the **$(pwd)/volumes-{hive,internet,intranet}** and carefully read the READMEs there.

Then use the following command to run the container, depending on your target environment.

e.g., for Hive,

~~~~
./run-in-hive.sh
~~~~

This should then start the container and place you inside.

Then go to the **/root** directory and view the README.md **before** performing any steps.

Following this, within the container, you should be able to continue the setup by running the playbook:

~~~~
ansible-playbook -vvv /usr/share/ansible/openshift-ansible/playbooks/byo/config.yml | tee ansible-run-`date +%Y%m%d%H%M%S`.log
~~~~

or use the convenience script:

~~~~
./setup/run_playbook.sh
~~~~

# Developers/How to build

. Verify that the repositories listed in **conf/local.repo** are accessible and
up-to-date.
. Build the docker image, e.g.,

~~~~
docker build -t ida.gov.sg/ose-installer .
~~~~

# Links

* https://docs.openshift.com/enterprise/3.2/install_config/install/prerequisites.html
* https://github.com/openshift/openshift-ansible/issues/1535#issuecomment-224187922

# Contact
George Goh <george.goh@redhat.com>
Christopher Kim <ckim@redhat.com>
