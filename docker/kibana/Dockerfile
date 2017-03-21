FROM intelonp/centos-source-base:2.4.20170321
MAINTAINER Intel Corp. (http://www.intel.com)








RUN usermod --append --home /var/lib/kibana --groups kolla kibana \
    && mkdir -p /var/lib/kibana \
    && chown -R 42426:42426 /var/lib/kibana



RUN yum -y install kibana && yum clean all

COPY extend_start.sh /usr/local/bin/kolla_extend_start
RUN chmod 755 /usr/local/bin/kolla_extend_start




USER kibana