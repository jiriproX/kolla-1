FROM intelonp/centos-source-base:2.4.20170320
MAINTAINER Intel Corp. (http://www.intel.com)






    


RUN yum -y install cronie logrotate && yum clean all

COPY extend_start.sh /usr/local/bin/kolla_extend_start
RUN chmod 755 /usr/local/bin/kolla_extend_start


