FROM intelonp/centos-source-neutron-base:2.3.201610190134
MAINTAINER Intel Corp. (http://www.intel.com)






RUN yum -y install haproxy net-tools && yum clean all



RUN mkdir -p /neutron-lbaas-agent-source && git clone git://git.openstack.org/openstack/neutron-lbaas /neutron-lbaas-agent-source/neutron-lbaas-agent && pushd /neutron-lbaas-agent-source/neutron-lbaas-agent && git checkout 65287382f2f5d9f55d0f12e51a689f5229863c6b && popd

RUN ln -s neutron-lbaas-agent-source/* neutron_lbaas \
    && /var/lib/kolla/venv/bin/pip --no-cache-dir install --upgrade -c requirements/upper-constraints.txt /neutron_lbaas \
    && cp /neutron_lbaas/etc/neutron/rootwrap.d/* /etc/neutron/rootwrap.d \
    && sed -i 's|^exec_dirs.*|exec_dirs=/var/lib/kolla/venv/bin,/sbin,/usr/sbin,/bin,/usr/bin,/usr/local/bin,/usr/local/sbin|g' /etc/neutron/rootwrap.conf



COPY extend_start.sh /usr/local/bin/kolla_neutron_extend_start
RUN chmod 755 /usr/local/bin/kolla_neutron_extend_start





USER neutron