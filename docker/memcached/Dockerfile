FROM intelonp/centos-source-base:2.4.20170320
MAINTAINER Intel Corp. (http://www.intel.com)







RUN usermod --append --home /run/memcache --groups kolla memcached \
    && mkdir -p /run/memcache \
    && chown -R 42457:42457 /run/memcache



RUN yum -y install memcached && yum clean all




USER memcached