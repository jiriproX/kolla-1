FROM intelonp/centos-source-base:2.4.20170321
MAINTAINER Intel Corp. (http://www.intel.com)






    


RUN yum -y install openvswitch && yum clean all

COPY extend_start.sh /usr/local/bin/kolla_extend_start

RUN touch /usr/local/bin/kolla_openvswitch_extend_start \
    && chmod 755 /usr/local/bin/kolla_extend_start /usr/local/bin/kolla_openvswitch_extend_start

