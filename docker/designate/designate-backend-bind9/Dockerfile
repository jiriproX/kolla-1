FROM intelonp/centos-source-designate-base:17.04.0
MAINTAINER Intel Corp. (http://www.intel.com)






   

RUN yum -y install bind && yum clean all





RUN mkdir -p /var/lib/kolla/ /var/lib/named/ /run/named \
     && chown -R root: /var/lib/named /run/named \
     && chmod 755 /run/named \


