FROM intelonp/centos-source-ironic-base:2.3.201610190134
MAINTAINER Intel Corp. (http://www.intel.com)






    


RUN yum -y install tftp-server syslinux-tftpboot && yum clean all

COPY tftp-map-file /map-file
COPY extend_start.sh /usr/local/bin/kolla_ironic_extend_start
RUN chmod 755 /usr/local/bin/kolla_ironic_extend_start



