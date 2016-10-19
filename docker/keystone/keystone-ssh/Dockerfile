FROM intelonp/centos-source-keystone-base:2.3.201610190134
MAINTAINER Intel Corp. (http://www.intel.com)






    

RUN yum -y install openssh-server rsync && yum clean all

COPY extend_start.sh /usr/local/bin/kolla_extend_start
RUN chmod 755 /usr/local/bin/kolla_extend_start



