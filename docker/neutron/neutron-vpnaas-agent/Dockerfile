FROM intelonp/centos-source-neutron-base:17.04.0
MAINTAINER Intel Corp. (http://www.intel.com)







   
       
   

RUN yum -y install openswan && yum clean all

RUN mkdir -p /neutron-vpnaas-agent-source && git clone git://git.openstack.org/openstack/neutron-vpnaas /neutron-vpnaas-agent-source/neutron-vpnaas-agent && pushd /neutron-vpnaas-agent-source/neutron-vpnaas-agent && git checkout 6011ca5c2de41c0e6559cf1a091d774d296c8b9a && popd

RUN ln -s neutron-vpnaas-agent-source/* neutron_vpnaas \
    && /var/lib/kolla/venv/bin/pip --no-cache-dir install --upgrade -c requirements/upper-constraints.txt /neutron_vpnaas \
    && cp /neutron_vpnaas/etc/neutron/rootwrap.d/* /etc/neutron/rootwrap.d



COPY extend_start.sh /usr/local/bin/kolla_neutron_extend_start
RUN chmod 755 /usr/local/bin/kolla_neutron_extend_start




# TODO(pbourke): The libreswan driver required by redhat derived bases
# currently requires root in Neutron. Remove this if condition once
# https://bugs.launchpad.net/neutron/+bug/1644517 is addressed.