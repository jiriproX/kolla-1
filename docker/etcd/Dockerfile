FROM intelonp/centos-source-base:2.3.201610190134
MAINTAINER Intel Corp. (http://www.intel.com)






    

RUN yum -y install etcd && yum clean all

COPY etcd_sudoers /etc/sudoers.d/etcd_sudoers
COPY extend_start.sh /usr/local/bin/kolla_extend_start

RUN chmod 755 /usr/local/bin/kolla_extend_start \
    && chmod 750 /etc/sudoers.d \
    && chmod 440 /etc/sudoers.d/etcd_sudoers \
    && usermod -a -G kolla etcd





USER etcd