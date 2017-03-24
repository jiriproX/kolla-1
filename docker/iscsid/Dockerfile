FROM intelonp/centos-source-base:17.04.0
MAINTAINER Intel Corp. (http://www.intel.com)






    



RUN yum -y install iscsi-initiator-utils targetcli python-rtslib && yum clean all

COPY extend_start.sh /usr/local/bin/kolla_extend_start
RUN chmod 755 /usr/local/bin/kolla_extend_start \
    && rm /etc/iscsi/initiatorname.iscsi


