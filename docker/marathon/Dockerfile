FROM intelonp/centos-source-mesos-base:17.04.0-test
MAINTAINER Intel Corp. (http://www.intel.com)



RUN yum install -y \
        marathon \
    && yum clean all



RUN useradd --user-group marathon \
    && chmod 755 /usr/bin/marathon

CMD ["marathon", "--no-logger"]



USER marathon