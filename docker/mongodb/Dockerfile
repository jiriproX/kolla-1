FROM intelonp/centos-source-base:17.04.0-test
MAINTAINER Intel Corp. (http://www.intel.com)








RUN usermod --append --home /var/lib/mongodb --groups kolla mongodb \
    && mkdir -p /var/lib/mongodb \
    && chown -R 42432:65534 /var/lib/mongodb



    


RUN yum -y install mongodb mongodb-server && yum clean all

COPY mongodb_sudoers /etc/sudoers.d/kolla_mongodb_sudoers
COPY extend_start.sh /usr/local/bin/kolla_extend_start

RUN chmod 755 /usr/local/bin/kolla_extend_start \
    && chmod 750 /etc/sudoers.d \
    && chmod 440 /etc/sudoers.d/kolla_mongodb_sudoers




USER mongodb