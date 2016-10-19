FROM intelonp/centos-source-base:2.3.201610190134
MAINTAINER Intel Corp. (http://www.intel.com)






    


RUN yum -y install mongodb mongodb-server && yum clean all

RUN mkdir -p /var/lib/mongodb /home/mongodb \
    && chown -R mongodb: /var/lib/mongodb /home/mongodb

COPY mongodb_sudoers /etc/sudoers.d/kolla_mongodb_sudoers
COPY extend_start.sh /usr/local/bin/kolla_extend_start

RUN usermod -a -G kolla mongodb \
    && chmod 755 /usr/local/bin/kolla_extend_start \
    && chmod 750 /etc/sudoers.d \
    && chmod 440 /etc/sudoers.d/kolla_mongodb_sudoers





USER mongodb