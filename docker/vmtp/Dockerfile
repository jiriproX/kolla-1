FROM intelonp/centos-source-openstack-base:2.3.201610190134
MAINTAINER Intel Corp. (http://www.intel.com)





RUN pip install vmtp \
    && useradd --user-group vmtp



COPY vmtp_sudoers /etc/sudoers.d/kolla_vmtp_sudoers
RUN chmod 750 /etc/sudoers.d \
    && chmod 440 /etc/sudoers.d \
    && usermod -a -G kolla vmtp





USER vmtp