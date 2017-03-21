FROM intelonp/centos-source-openstack-base:2.4.20170321
MAINTAINER Intel Corp. (http://www.intel.com)








RUN usermod --append --home /var/lib/neutron --groups kolla neutron \
    && mkdir -p /var/lib/neutron \
    && chown -R 42435:42435 /var/lib/neutron





    

        

    

RUN yum -y install conntrack-tools dnsmasq dnsmasq-utils ipset keepalived openvswitch python-openvswitch uuid && yum clean all

RUN mkdir -p /neutron-base-source && git clone git://git.openstack.org/openstack/neutron /neutron-base-source/neutron-base && pushd /neutron-base-source/neutron-base && git checkout 9886bdaf1f1654cd88961615c3cdb89e6d05e82e && popd

ADD plugins-archive /
RUN ln -s neutron-base-source/* neutron \
    && /var/lib/kolla/venv/bin/pip --no-cache-dir install --upgrade -c requirements/upper-constraints.txt /neutron \
    && mkdir -p /etc/neutron /usr/share/neutron \
    && cp -r /neutron/etc/* /etc/neutron/ \
    && cp -r /neutron/etc/neutron/* /etc/neutron/ \
    && cp /neutron/etc/api-paste.ini /usr/share/neutron \
    && mv /etc/neutron/neutron/ /etc/neutron/plugins/ \
    && chown -R neutron: /etc/neutron /usr/share/neutron \
    && sed -i 's|^exec_dirs.*|exec_dirs=/var/lib/kolla/venv/bin,/sbin,/usr/sbin,/bin,/usr/bin,/usr/local/bin,/usr/local/sbin|g' /etc/neutron/rootwrap.conf \
    && if [ "$(ls /plugins)" ]; then \
        pip --no-cache-dir install --upgrade -c requirements/upper-constraints.txt /plugins/*; \
    fi



COPY neutron_sudoers /etc/sudoers.d/kolla_neutron_sudoers
COPY extend_start.sh /usr/local/bin/kolla_extend_start

RUN chmod 750 /etc/sudoers.d \
    && chmod 440 /etc/sudoers.d/kolla_neutron_sudoers \
    && touch /usr/local/bin/kolla_neutron_extend_start \
    && chmod 755 /usr/local/bin/kolla_extend_start /usr/local/bin/kolla_neutron_extend_start
