FROM intelonp/centos-source-neutron-base:17.04.0-test
MAINTAINER Intel Corp. (http://www.intel.com)





RUN mkdir -p /neutron-sfc-agent-source && git clone git://git.openstack.org/openstack/networking-sfc /neutron-sfc-agent-source/neutron-sfc-agent && pushd /neutron-sfc-agent-source/neutron-sfc-agent && git checkout 7c4ef32f5b2eac86372729c9e8e0caabf317e3fa && popd

RUN ln -s neutron-sfc-agent-source/* neutron-sfc-agent \
    && /var/lib/kolla/venv/bin/pip --no-cache-dir install --upgrade -c requirements/upper-constraints.txt /neutron-sfc-agent



COPY extend_start.sh /usr/local/bin/kolla_neutron_extend_start
RUN chmod 755 /usr/local/bin/kolla_neutron_extend_start




USER neutron