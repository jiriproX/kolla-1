FROM intelonp/centos-source-nova-base:2.3.201610190134
MAINTAINER Intel Corp. (http://www.intel.com)









RUN yum -y install openssh-server && yum clean all

RUN chsh -s /bin/bash nova

COPY extend_start.sh /usr/local/bin/kolla_extend_start
RUN chmod 755 /usr/local/bin/kolla_extend_start



