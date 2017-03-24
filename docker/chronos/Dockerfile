FROM intelonp/centos-source-mesos-base:2.4.201703130523
MAINTAINER Intel Corp. (http://www.intel.com)



RUN yum install -y \
        chronos \
    && yum clean all



RUN useradd --user-group chronos

CMD chronos run_jar --http_port $CHRONOS_HTTP_PORT --master $CHRONOS_MASTER --zk_hosts $CHRONOS_ZK_HOSTS



USER chronos