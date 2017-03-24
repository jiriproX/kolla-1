FROM intelonp/centos-source-neutron-base:17.04.0
MAINTAINER Intel Corp. (http://www.intel.com)









RUN mkdir -p /plugins && git clone git://git.openstack.org/openstack/neutron-lbaas-dashboard /plugins/horizon-plugin-neutron-lbaas-dashboard && pushd /plugins/horizon-plugin-neutron-lbaas-dashboard && git checkout a2e63f8488be5687722708489e7f63e5d5c487a0 && popd

COPY extend_start.sh /usr/local/bin/kolla_neutron_extend_start
RUN chmod 755 /usr/local/bin/kolla_neutron_extend_start \
    && if [ "$(ls /plugins)" ]; then \
           pip --no-cache-dir install --upgrade -c requirements/upper-constraints.txt /plugins/*; \
       fi




USER neutron