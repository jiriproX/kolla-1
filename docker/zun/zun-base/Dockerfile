FROM intelonp/centos-source-openstack-base:17.04.0
MAINTAINER Intel Corp. (http://www.intel.com)





RUN mkdir -p /zun-base-source && git clone http://tarballs.openstack.org/zun/zun-master.tar.gz /zun-base-source/zun-base && pushd /zun-base-source/zun-base && git checkout None && popd

RUN ln -s zun-base-source/* zun \
    && useradd --user-group --create-home --home-dir /var/lib/zun zun \
    && /var/lib/kolla/venv/bin/pip --no-cache-dir install --upgrade -c requirements/upper-constraints.txt /zun \
    && mkdir -p /etc/zun \
    && cp -r /zun/etc/* /etc/zun/ \
    && chown -R zun: /etc/zun



COPY extend_start.sh /usr/local/bin/kolla_extend_start

RUN usermod -a -G kolla zun \
    && touch /usr/local/bin/kolla_zun_extend_start \
    && chmod 755 /usr/local/bin/kolla_extend_start /usr/local/bin/kolla_zun_extend_start
