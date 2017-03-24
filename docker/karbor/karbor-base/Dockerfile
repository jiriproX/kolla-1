FROM intelonp/centos-source-openstack-base:17.04.0
MAINTAINER Intel Corp. (http://www.intel.com)








RUN usermod --append --home /var/lib/karbor --groups kolla karbor \
    && mkdir -p /var/lib/karbor \
    && chown -R 42458:42458 /var/lib/karbor




RUN mkdir -p /karbor-base-source && git clone http://tarballs.openstack.org/karbor/karbor-master.tar.gz /karbor-base-source/karbor-base && pushd /karbor-base-source/karbor-base && git checkout None && popd

RUN ln -s karbor-base-source/* karbor \
    && /var/lib/kolla/venv/bin/pip --no-cache-dir install --upgrade -c requirements/upper-constraints.txt /karbor \
    && mkdir -p /etc/karbor \
    && cp -r /karbor/etc/* /etc/karbor/ \
    && chown -R karbor: /etc/karbor



COPY extend_start.sh /usr/local/bin/kolla_extend_start

RUN touch /usr/local/bin/kolla_karbor_extend_start \
    && chmod 755 /usr/local/bin/kolla_extend_start /usr/local/bin/kolla_karbor_extend_start
