FROM intelonp/centos-source-base:2.3.201610190134
MAINTAINER Intel Corp. (http://www.intel.com)








    
RUN yum -y install memcached && yum clean all \
    && usermod -a -G kolla memcached







USER memcached