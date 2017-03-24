FROM intelonp/centos-source-base:17.04.0-test
MAINTAINER Intel Corp. (http://www.intel.com)







RUN usermod --append --home /run/redis --groups kolla redis \
    && mkdir -p /run/redis \
    && chown -R 42460:42460 /run/redis



    

RUN yum -y install redis && yum clean all




USER redis