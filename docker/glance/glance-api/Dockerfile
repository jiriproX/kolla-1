FROM intelonp/centos-source-glance-base:2.4.20170320
MAINTAINER Intel Corp. (http://www.intel.com)






    


RUN yum -y install qemu-img && yum clean all

COPY extend_start.sh /usr/local/bin/kolla_glance_extend_start
RUN chmod 755 /usr/local/bin/kolla_glance_extend_start




USER glance