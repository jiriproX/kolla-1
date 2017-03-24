FROM intelonp/centos-source-base:17.04.0-test
MAINTAINER Intel Corp. (http://www.intel.com)







RUN usermod --append --home /usr/share/grafana --groups kolla grafana \
    && mkdir -p /usr/share/grafana \
    && chown -R 42417:42417 /usr/share/grafana



RUN yum -y install grafana && yum clean all

WORKDIR /usr/share/grafana

COPY grafana_sudoers /etc/sudoers.d/kolla_grafana_sudoers
COPY extend_start.sh /usr/local/bin/kolla_extend_start

RUN grafana-cli plugins install sileht-gnocchi-datasource \
    && chmod 750 /etc/sudoers.d \
    && chmod 440 /etc/sudoers.d/kolla_grafana_sudoers \
    && chmod 755 /usr/local/bin/kolla_extend_start




USER grafana