FROM intelonp/centos-source-cinder-base:17.04.0-test
MAINTAINER Intel Corp. (http://www.intel.com)






    
RUN yum -y install nfs-utils scsi-target-utils nfs-utils && yum clean all


RUN sed -i '1 i include /var/lib/cinder/volumes/*' /etc/tgt/tgtd.conf






COPY cinder_sudoers /etc/sudoers.d/kolla_cinder_volume_sudoers
COPY extend_start.sh /usr/local/bin/kolla_cinder_extend_start

RUN chmod 750 /etc/sudoers.d \
    && chmod 440 /etc/sudoers.d/kolla_cinder_volume_sudoers \
    && chmod 755 /usr/local/bin/kolla_cinder_extend_start




USER cinder