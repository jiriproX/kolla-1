FROM intelonp/centos-source-base:2.3.201610190134
MAINTAINER Intel Corp. (http://www.intel.com)






RUN yum -y install influxdb && yum clean all

COPY influxdb_sudoers /etc/sudoers.d/kolla_influxdb_sudoers
RUN chmod 750 /etc/sudoers.d \
    && chmod 440 /etc/sudoers.d/kolla_influxdb_sudoers \
    && usermod -a -G kolla influxdb





USER influxdb