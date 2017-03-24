FROM intelonp/centos-source-mesos-base:2.4.201703130523
MAINTAINER Intel Corp. (http://www.intel.com)



RUN yum install -y \
        marathon \
    && yum clean all



RUN useradd --user-group marathon \
    && chmod 755 /usr/bin/marathon

CMD ["marathon", "--no-logger"]



USER marathon