# Operator README

Read this entire document completely before attempting any setup procedures.

NOTE: If you are not reading this document *within* the container, run it
**now**, and continue from there.

## Pre-flight checks

Ensure that the following items are verified:

1. **/etc/ansible/hosts** - verify all host names in the file, and that the
groupings are correct.
2. Verify that **ose-master-int.{e|i}.nectar.gov.sg** DNS name has been
created and points to the appropriate node/F5.
3. Verify that the certs in **/opt/custom-certs/** are correct and generated
properly from the *.pfx* files. The necessary files are:
. master.crt
. master.key
. custom-ca.pem
. cloudapps.router.pem
4. Copy the id_rsa* files into /root/.ssh (verify the permissions are appropriate)
5. Test ansible run using
~~~~
ansible nodes -m ping
~~~~

## Pre-setup

Run each of the scripts in the directory **/root/pre-setup**.

## Setup

Run the **run-playbook.sh** script in the directory **/root/setup**.

## Post-Setup

Run each of the scripts in the directory **/root/post-setup**.

They will set up the router, registry, and metrics

NOTE: Currently some manual rework will need to be done for the registry pods.
By default, they deploy to infra nodes - but in the GDC environment, they should
be deployed onto the master nodes in the COMMON zone, so that all nodes can access
the internal registry. Make sure that the labels are correctly set on the master
and that they are marked as schedulable.

NOTE 2: Custom labels and selectors may be required to prevent router pods from
running on the master nodes, since they will be marked as schedulable.
 
