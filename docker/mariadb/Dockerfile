FROM intelonp/centos-source-base:2.3.201610190134
MAINTAINER Intel Corp. (http://www.intel.com)






    


RUN yum -y install MariaDB-Galera-server MariaDB-client rsync galera socat hostname percona-xtrabackup pv tar expect && yum clean all
COPY mariadb_sudoers /etc/sudoers.d/kolla_mariadb_sudoers
COPY extend_start.sh /usr/local/bin/kolla_extend_start
COPY security_reset.expect /usr/local/bin/kolla_security_reset
RUN chmod 755 /usr/local/bin/kolla_extend_start \
    && chmod 755 /usr/local/bin/kolla_security_reset \
    && chmod 750 /etc/sudoers.d \
    && chmod 440 /etc/sudoers.d/kolla_mariadb_sudoers \
    && usermod -a -G kolla mysql \
    && rm -rf /var/lib/mysql/*





USER mysql