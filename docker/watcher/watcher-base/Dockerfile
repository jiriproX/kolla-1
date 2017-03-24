FROM intelonp/centos-source-openstack-base:2.4.201703130523
MAINTAINER Intel Corp. (http://www.intel.com)








RUN usermod --append --home /var/lib/watcher --groups kolla watcher \
    && mkdir -p /var/lib/watcher \
    && chown -R 42451:42451 /var/lib/watcher




RUN mkdir -p /watcher-base-source && git clone git://git.openstack.org/openstack/watcher /watcher-base-source/watcher-base && pushd /watcher-base-source/watcher-base && git checkout 1caf89686c7f13e8164dbbd6bd8c09b9ee66f9c4 && popd

RUN ln -s watcher-base-source/* watcher \
    && /var/lib/kolla/venv/bin/pip --no-cache-dir install --upgrade -c requirements/upper-constraints.txt /watcher \
    && mkdir -p /etc/watcher \
    && cp -r /watcher/etc/watcher/* /etc/watcher/ \
    && chown -R watcher: /etc/watcher



COPY extend_start.sh /usr/local/bin/kolla_extend_start

RUN touch /usr/local/bin/kolla_watcher_extend_start \
    && chmod 755 /usr/local/bin/kolla_extend_start /usr/local/bin/kolla_watcher_extend_start
