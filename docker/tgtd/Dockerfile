FROM intelonp/centos-source-base:17.04.0-test
MAINTAINER Intel Corp. (http://www.intel.com)






    

RUN yum -y install scsi-target-utils && yum clean all
RUN sed -i '1 i include /var/lib/cinder/volumes/*' /etc/tgt/tgtd.conf




