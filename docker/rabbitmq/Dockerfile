FROM intelonp/centos-source-base:17.04.0-test
MAINTAINER Intel Corp. (http://www.intel.com)








RUN usermod --append --home /var/lib/rabbitmq --groups kolla rabbitmq \
    && mkdir -p /var/lib/rabbitmq \
    && chown -R 42439:42439 /var/lib/rabbitmq




    

RUN yum -y install hostname rabbitmq-server && yum clean all






# NOTE(sdake): the /bin/true unblocks the rabbitmq-plugins tool. Not sure how
#              or why.  My suspicion is it sends a signal to the parent
#              process.

RUN rm -rf /var/lib/rabbitmq/* \
    && ln -s /usr/lib/rabbitmq/lib/rabbitmq_server-3.6.* /usr/lib/rabbitmq/lib/rabbitmq_server-3.6 \
    && curl -o /usr/lib/rabbitmq/lib/rabbitmq_server-3.6/plugins/rabbitmq_clusterer-3.6.x-667f92b0.ez http://www.rabbitmq.com/community-plugins/v3.6.x/rabbitmq_clusterer-3.6.x-667f92b0.ez \
    && /usr/lib/rabbitmq/bin/rabbitmq-plugins enable --offline \
       rabbitmq_management \
       rabbitmq_clusterer \
    && /bin/true



COPY extend_start.sh /usr/local/bin/kolla_extend_start
COPY rabbitmq_sudoers /etc/sudoers.d/kolla_rabbitmq_sudoers
COPY rabbitmq_get_gospel_node.py /usr/local/bin/rabbitmq_get_gospel_node
RUN chmod 755 /usr/local/bin/kolla_extend_start /usr/local/bin/rabbitmq_get_gospel_node \
    && chmod 750 /etc/sudoers.d \
    && chmod 440 /etc/sudoers.d/kolla_rabbitmq_sudoers




USER rabbitmq