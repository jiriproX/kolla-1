FROM intelonp/centos-source-base:2.3.201610190134
MAINTAINER Intel Corp. (http://www.intel.com)





RUN useradd -r -m --user-group kibana \
    && usermod -a -G kolla kibana


RUN yum -y install kibana && yum clean all





USER kibana