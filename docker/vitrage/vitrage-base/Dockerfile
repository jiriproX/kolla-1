FROM intelonp/centos-source-openstack-base:17.04.0
MAINTAINER Intel Corp. (http://www.intel.com)








RUN usermod --append --home /var/lib/vitrage --groups kolla vitrage \
    && mkdir -p /var/lib/vitrage \
    && chown -R 42459:42459 /var/lib/vitrage




RUN mkdir -p /vitrage-base-source && git clone http://tarballs.openstack.org/vitrage/vitrage-master.tar.gz /vitrage-base-source/vitrage-base && pushd /vitrage-base-source/vitrage-base && git checkout None && popd

RUN ln -s vitrage-base-source/* vitrage \
    && /var/lib/kolla/venv/bin/pip --no-cache-dir install --upgrade -c requirements/upper-constraints.txt /vitrage \
    && mkdir -p /etc/vitrage \
    && cp -r /vitrage/etc/vitrage/* /etc/vitrage/ \
    && chown -R vitrage: /etc/vitrage



COPY extend_start.sh /usr/local/bin/kolla_extend_start

RUN chmod 755 /usr/local/bin/kolla_extend_start
