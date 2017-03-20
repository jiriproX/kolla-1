FROM intelonp/centos-source-openstack-base:2.4.20170320
MAINTAINER Intel Corp. (http://www.intel.com)








RUN usermod --append --home /var/lib/manila --groups kolla manila \
    && mkdir -p /var/lib/manila \
    && chown -R 42429:42429 /var/lib/manila



    

        

    

RUN yum -y install openvswitch && yum clean all

RUN mkdir -p /manila-base-source && git clone git://git.openstack.org/openstack/manila /manila-base-source/manila-base && pushd /manila-base-source/manila-base && git checkout 7b60653007e13c8ece27fc2fdaba94e8ecc6c4d3 && popd

RUN ln -s manila-base-source/* manila \
    && /var/lib/kolla/venv/bin/pip --no-cache-dir install --upgrade -c requirements/upper-constraints.txt /manila \
    && mkdir -p /etc/manila /var/cache/manila \
    && cp -r /manila/etc/manila/* /etc/manila/ \
    && chown -R manila: /etc/manila /var/cache/manila \
    && sed -i 's|^exec_dirs.*|exec_dirs=/var/lib/kolla/venv/bin,/sbin,/usr/sbin,/bin,/usr/bin,/usr/local/bin,/usr/local/sbin|g' /etc/manila/rootwrap.conf



COPY extend_start.sh /usr/local/bin/kolla_extend_start
COPY manila_sudoers /etc/sudoers.d/kolla_manila_sudoers

RUN chmod 750 /etc/sudoers.d \
    && chmod 440 /etc/sudoers.d/kolla_manila_sudoers \
    && touch /usr/local/bin/kolla_manila_extend_start \
    && chmod 755 /usr/local/bin/kolla_extend_start /usr/local/bin/kolla_manila_extend_start
