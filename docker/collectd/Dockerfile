FROM intelonp/centos-source-openstack-base:2.3.201610190134
MAINTAINER Intel Corp. (http://www.intel.com)





RUN yum -y install collectd && yum clean all
COPY collectd_sudoers /etc/sudoers.d/kolla_collectd_sudoers
COPY extend_start.sh /usr/local/bin/kolla_extend_start

RUN useradd -r -m collectd \
    && chmod 755 /usr/local/bin/kolla_extend_start \
    && chmod 750 /etc/sudoers.d \
    && chmod 440 /etc/sudoers.d/kolla_collectd_sudoers \
    && usermod -a -G kolla collectd \
    && chown -R collectd /var/lib/collectd \
    && chown -R collectd /etc/collectd* \
    && chown -R collectd /var/run/





USER collectd