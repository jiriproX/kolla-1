FROM intelonp/centos-source-neutron-base:2.3.201610190134
MAINTAINER Intel Corp. (http://www.intel.com)







RUN mkdir -p /neutron-vpnaas-agent-source && git clone git://git.openstack.org/openstack/neutron-vpnaas /neutron-vpnaas-agent-source/neutron-vpnaas-agent && pushd /neutron-vpnaas-agent-source/neutron-vpnaas-agent && git checkout 89dac51538b711d8e966d4a4a50f9cdfafa92fc5 && popd

RUN ln -s neutron-vpnaas-agent-source/* neutron_vpnaas \
    && /var/lib/kolla/venv/bin/pip --no-cache-dir install --upgrade -c requirements/upper-constraints.txt /neutron_vpnaas \
    && cp /neutron_vpnaas/etc/neutron/rootwrap.d/* /etc/neutron/rootwrap.d



COPY extend_start.sh /usr/local/bin/kolla_neutron_extend_start
RUN chmod 755 /usr/local/bin/kolla_neutron_extend_start





USER neutron