FROM intelonp/centos-source-base:2.3.201610190134
MAINTAINER Intel Corp. (http://www.intel.com)






RUN yum -y install grafana && yum clean all

RUN usermod -a -G kolla grafana

WORKDIR /usr/share/grafana

COPY grafana_sudoers /etc/sudoers.d/kolla_grafana_sudoers
COPY extend_start.sh /usr/local/bin/kolla_extend_start





USER grafana