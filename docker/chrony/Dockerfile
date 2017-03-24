FROM intelonp/centos-source-base:17.04.0-test
MAINTAINER Intel Corp. (http://www.intel.com)








RUN usermod --append --home /var/lib/chrony --groups kolla chrony \
    && mkdir -p /var/lib/chrony \
    && chown -R 42406:42406 /var/lib/chrony




RUN yum -y install chrony && yum clean all

COPY extend_start.sh /usr/local/bin/kolla_extend_start
RUN chmod 755 /usr/local/bin/kolla_extend_start


