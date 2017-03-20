FROM intelonp/centos-source-base:2.4.20170320
MAINTAINER Intel Corp. (http://www.intel.com)








RUN usermod --append --home /var/lib/zookeeper --groups kolla zookeeper \
    && mkdir -p /var/lib/zookeeper \
    && chown -R 42453:42453 /var/lib/zookeeper



    


RUN yum -y install zookeeper && yum clean all

COPY extend_start.sh /usr/local/bin/kolla_extend_start
RUN chmod 755 /usr/local/bin/kolla_extend_start




USER zookeeper