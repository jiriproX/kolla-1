FROM intelonp/centos-source-base:2.3.201610190134
MAINTAINER Intel Corp. (http://www.intel.com)






RUN yum -y install haproxy && yum clean all

RUN usermod -a -G kolla haproxy \
    && mkdir -p /var/lib/kolla/haproxy \
    && chown -R haproxy: /var/lib /run

COPY ensure_latest_config.sh /usr/local/bin/kolla_ensure_haproxy_latest_config
RUN chmod 755 /usr/local/bin/kolla_ensure_haproxy_latest_config



