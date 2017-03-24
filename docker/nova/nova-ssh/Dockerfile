FROM intelonp/centos-source-nova-base:17.04.0-test
MAINTAINER Intel Corp. (http://www.intel.com)









RUN yum -y install openssh-server && yum clean all

RUN chsh -s /bin/bash nova \
    && sed -ri 's/session(\s+)required(\s+)pam_loginuid.so/session\1optional\2pam_loginuid.so/' /etc/pam.d/sshd

COPY extend_start.sh /usr/local/bin/kolla_extend_start
RUN chmod 755 /usr/local/bin/kolla_extend_start


