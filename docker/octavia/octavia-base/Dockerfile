FROM intelonp/centos-source-openstack-base:17.04.0
MAINTAINER Intel Corp. (http://www.intel.com)








RUN usermod --append --home /var/lib/octavia --groups kolla octavia \
    && mkdir -p /var/lib/octavia \
    && chown -R 42437:42437 /var/lib/octavia



RUN mkdir -p /octavia-base-source && git clone http://tarballs.openstack.org/octavia/octavia-master.tar.gz /octavia-base-source/octavia-base && pushd /octavia-base-source/octavia-base && git checkout None && popd

RUN ln -s /octavia-base-source/* octavia \
    && /var/lib/kolla/venv/bin/pip --no-cache-dir install --upgrade -c requirements/upper-constraints.txt /octavia \
    && mkdir -p /etc/octavia \
    && cp -r /octavia/etc/* /etc/octavia/ \
    && chown -R octavia: /etc/octavia


COPY extend_start.sh /usr/local/bin/kolla_extend_start

RUN touch /usr/local/bin/kolla_octavia_extend_start \
    && chmod 755 /usr/local/bin/kolla_extend_start /usr/local/bin/kolla_octavia_extend_start
