FROM intelonp/centos-source-base:17.04.0
MAINTAINER Intel Corp. (http://www.intel.com)







RUN usermod --append --home /kafka --groups kolla kafka \
    && mkdir -p /kafka \
    && chown -R 42423:42423 /kafka




RUN echo 'source not yet available for centos' \
    && /bin/false






RUN curl -o kafka.tgz http://apache.osuosl.org/kafka/0.10.1.0/kafka_2.11-0.10.1.0.tgz \
    && tar xfvz kafka.tgz \
    && rm kafka.tgz \
    && ln -s kafka* kafka


COPY extend_start.sh /usr/local/bin/kolla_extend_start
RUN chmod 755 /usr/local/bin/kolla_extend_start \
    && chown -R kafka: /kafka




USER kafka