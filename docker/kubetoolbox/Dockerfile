FROM intelonp/centos-source-base:2.4.20170321
MAINTAINER Intel Corp. (http://www.intel.com)







RUN yum -y install jq ceph-common ipmitool && yum clean all

RUN curl -o /usr/bin/kubectl http://storage.googleapis.com/kubernetes-release/release/v1.4.0/bin/linux/amd64/kubectl \
    && chmod 755 /usr/bin/kubectl


