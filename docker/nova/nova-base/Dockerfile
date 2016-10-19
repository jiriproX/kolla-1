FROM intelonp/centos-source-openstack-base:2.3.201610190134
MAINTAINER Intel Corp. (http://www.intel.com)






    

        

    

RUN yum -y install bridge-utils openvswitch && yum clean all

RUN mkdir -p /nova-base-source && git clone git://git.openstack.org/openstack/nova /nova-base-source/nova-base && pushd /nova-base-source/nova-base && git checkout e08cc356b0fb78163657f7a6e99572039fd58543 && popd

RUN ln -s nova-base-source/* nova \
    && useradd --user-group --create-home --home-dir /var/lib/nova nova \
    && chmod 755 /var/lib/nova \
    && /var/lib/kolla/venv/bin/pip --no-cache-dir install --upgrade -c requirements/upper-constraints.txt /nova \
    && mkdir -p /etc/nova /var/lib/nova \
    && cp -r /nova/etc/nova/* /etc/nova/ \
    && chown -R nova: /etc/nova /var/lib/nova \
    && sed -i 's|^exec_dirs.*|exec_dirs=/var/lib/kolla/venv/bin,/sbin,/usr/sbin,/bin,/usr/bin,/usr/local/bin,/usr/local/sbin|g' /etc/nova/rootwrap.conf

COPY nova_sudoers /etc/sudoers.d/kolla_nova_sudoers
RUN chmod 750 /etc/sudoers.d \
    && chmod 440 /etc/sudoers.d/kolla_nova_sudoers



COPY extend_start.sh /usr/local/bin/kolla_extend_start

RUN touch /usr/local/bin/kolla_nova_extend_start \
    && chmod 755 /usr/local/bin/kolla_extend_start /usr/local/bin/kolla_nova_extend_start

RUN usermod -a -G kolla nova
