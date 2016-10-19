FROM intelonp/centos-source-base:2.3.201610190134
MAINTAINER Intel Corp. (http://www.intel.com)






RUN yum -y install telegraf && yum clean all

COPY telegraf_sudoers /etc/sudoers.d/kolla_telegraf_sudoers
COPY extend_start.sh /usr/local/bin/kolla_telegraf_extend_start

RUN chmod 750 /etc/sudoers.d \
    && chmod 440 /etc/sudoers.d/kolla_telegraf_sudoers \
    && chmod 755 /usr/local/bin/kolla_telegraf_extend_start \
    && usermod -a -G kolla telegraf





USER telegraf