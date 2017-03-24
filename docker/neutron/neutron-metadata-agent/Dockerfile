FROM intelonp/centos-source-neutron-base:17.04.0
MAINTAINER Intel Corp. (http://www.intel.com)









COPY neutron_sudoers /etc/sudoers.d/kolla_neutron_metadata_sudoers
COPY extend_start.sh /usr/local/bin/kolla_neutron_extend_start
RUN chmod 755 /usr/local/bin/kolla_neutron_extend_start \
    && chmod 750 /etc/sudoers.d \
    && chmod 440 /etc/sudoers.d/kolla_neutron_metadata_sudoers




USER neutron