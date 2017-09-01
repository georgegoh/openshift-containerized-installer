from registry.access.redhat.com/rhel7.4

# use local repository instead of RHN.
COPY conf/tmux.conf /root/.tmux.conf

RUN yum --disablerepo=* \
    --enablerepo=rhel-7-server-rpms \
    --enablerepo=rhel-7-server-ose-3.6-rpms \
    --enablerepo=rhel-7-server-extras-rpms \
    --enablerepo=rhel-7-fast-datapath-rpms \
    clean all && \
yum --disablerepo=* \
    --enablerepo=rhel-7-server-rpms \
    --enablerepo=rhel-7-server-ose-3.6-rpms \
    --enablerepo=rhel-7-server-extras-rpms \
    --enablerepo=rhel-7-fast-datapath-rpms \
    -y install wget git net-tools bind-utils \
       iptables-services bridge-utils bash-completion \
       kexec-tools sos psacct && \
yum --disablerepo=* \
    --enablerepo=rhel-7-server-rpms \
    --enablerepo=rhel-7-server-ose-3.6-rpms \
    --enablerepo=rhel-7-server-extras-rpms \
    --enablerepo=rhel-7-fast-datapath-rpms \
    -y update && \
yum --disablerepo=* \
    --enablerepo=rhel-7-server-rpms \
    --enablerepo=rhel-7-server-ose-3.6-rpms \
    --enablerepo=rhel-7-server-extras-rpms \
    --enablerepo=rhel-7-fast-datapath-rpms \
    install -y atomic-openshift-utils && \
yum --disablerepo=* \
    --enablerepo=rhel-7-server-rpms \
    --enablerepo=rhel-7-server-ose-3.6-rpms \
    --enablerepo=rhel-7-server-extras-rpms \
    --enablerepo=rhel-7-fast-datapath-rpms \
    install -y patch tmux iputils telnet vim && \
yum clean all && \
rm -rf /tmp/*

# fetch ansible config.
VOLUME /etc/ansible

# mount custom-certs directory.
RUN mkdir /opt/custom-certs
VOLUME /opt/custom-certs

# mount pre-setup directory.
RUN mkdir /root/pre-setup
VOLUME /root/pre-setup

# mount post-setup directory.
RUN mkdir /root/post-setup
VOLUME /root/post-setup

# mount setup directory.
RUN mkdir /root/setup
VOLUME /root/setup

# copy operator README.
COPY OPERATOR-README.md /root/README.md

