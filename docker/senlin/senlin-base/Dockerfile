FROM intelonp/centos-source-openstack-base:2.3.201610190134
MAINTAINER Intel Corp. (http://www.intel.com)





RUN mkdir -p /senlin-base-source && git clone git://git.openstack.org/openstack/senlin /senlin-base-source/senlin-base && pushd /senlin-base-source/senlin-base && git checkout 0e302ca777819cacd4f7e33e708673e03618849e && popd

RUN ln -s senlin-base-source/* senlin \
    && useradd --user-group senlin \
    && /var/lib/kolla/venv/bin/pip --no-cache-dir install --upgrade -c requirements/upper-constraints.txt /senlin \
    && mkdir -p /etc/senlin \
    && cp -r /senlin/etc/senlin/* /etc/senlin \
    && chown -R senlin: /etc/senlin



COPY extend_start.sh /usr/local/bin/kolla_extend_start

RUN usermod -a -G kolla senlin \
    && touch /usr/local/bin/kolla_senlin_extend_start \
    && chmod 755 /usr/local/bin/kolla_extend_start /usr/local/bin/kolla_senlin_extend_start

