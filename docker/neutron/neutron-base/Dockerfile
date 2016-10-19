FROM intelonp/centos-source-openstack-base:2.3.201610190134
MAINTAINER Intel Corp. (http://www.intel.com)






    

        

    

RUN yum -y install conntrack-tools dnsmasq dnsmasq-utils ipset openvswitch python-openvswitch uuid && yum clean all

RUN mkdir -p /neutron-base-source && git clone git://git.openstack.org/openstack/neutron /neutron-base-source/neutron-base && pushd /neutron-base-source/neutron-base && git checkout 71f2d2bc90aaf9ee696cd4e4f29879ba6c5703b5 && popd

RUN ln -s neutron-base-source/* neutron \
    && useradd --user-group neutron \
    && /var/lib/kolla/venv/bin/pip --no-cache-dir install --upgrade -c requirements/upper-constraints.txt /neutron \
    && mkdir -p /etc/neutron /usr/share/neutron /var/lib/neutron /home/neutron \
    && cp -r /neutron/etc/* /etc/neutron/ \
    && cp -r /neutron/etc/neutron/* /etc/neutron/ \
    && cp /neutron/etc/api-paste.ini /usr/share/neutron \
    && mv /etc/neutron/neutron/ /etc/neutron/plugins/ \
    && chown -R neutron: /etc/neutron /usr/share/neutron /var/lib/neutron /home/neutron \
    && sed -i 's|^exec_dirs.*|exec_dirs=/var/lib/kolla/venv/bin,/sbin,/usr/sbin,/bin,/usr/bin,/usr/local/bin,/usr/local/sbin|g' /etc/neutron/rootwrap.conf



COPY neutron_sudoers /etc/sudoers.d/kolla_neutron_sudoers
COPY extend_start.sh /usr/local/bin/kolla_extend_start

RUN usermod -a -G kolla neutron \
    && chmod 750 /etc/sudoers.d \
    && chmod 440 /etc/sudoers.d/kolla_neutron_sudoers \
    && touch /usr/local/bin/kolla_neutron_extend_start \
    && chmod 755 /usr/local/bin/kolla_extend_start /usr/local/bin/kolla_neutron_extend_start
