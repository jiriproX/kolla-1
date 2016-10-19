FROM intelonp/centos-source-neutron-base:2.3.201610190134
MAINTAINER Intel Corp. (http://www.intel.com)





RUN mkdir -p /neutron-sfc-agent-source && git clone git://git.openstack.org/openstack/networking-sfc /neutron-sfc-agent-source/neutron-sfc-agent && pushd /neutron-sfc-agent-source/neutron-sfc-agent && git checkout dfd904d7ca814f404e0ad9c4f8383f57baf59a62 && popd

RUN ln -s neutron-sfc-agent-source/* neutron-sfc-agent \
    && /var/lib/kolla/venv/bin/pip --no-cache-dir install --upgrade -c requirements/upper-constraints.txt /neutron-sfc-agent \
    && cp /neutron-sfc-agent/etc/neutron/rootwrap.d/* /etc/neutron/rootwrap.d \
    && sed -i 's|^exec_dirs.*|exec_dirs=/var/lib/kolla/venv/bin,/sbin,/usr/sbin,/bin,/usr/bin,/usr/local/bin,/usr/local/sbin|g' /etc/neutron/rootwrap.conf



COPY extend_start.sh /usr/local/bin/kolla_neutron_extend_start
RUN chmod 755 /usr/local/bin/kolla_neutron_extend_start





USER neutron