FROM intelonp/centos-source-openstack-base:17.04.0
MAINTAINER Intel Corp. (http://www.intel.com)








RUN usermod --append --home /var/lib/glance --groups kolla glance \
    && mkdir -p /var/lib/glance \
    && chown -R 42415:42415 /var/lib/glance



    

RUN yum -y install python-rbd python-rados && yum clean all

RUN mkdir -p /glance-base-source && git clone git://git.openstack.org/openstack/glance /glance-base-source/glance-base && pushd /glance-base-source/glance-base && git checkout 8997684aabe54d0a8ba43aff0be52f64153d8a1a && popd

RUN ln -s glance-base-source/* glance \
    && /var/lib/kolla/venv/bin/pip --no-cache-dir install --upgrade -c requirements/upper-constraints.txt /glance[cinder] \
    && mkdir -p /etc/glance \
    && cp -r /glance/etc/* /etc/glance/ \
    && chown -R glance: /etc/glance



COPY glance_sudoers /etc/sudoers.d/kolla_glance_sudoers
COPY extend_start.sh /usr/local/bin/kolla_extend_start

RUN chmod 750 /etc/sudoers.d \
    && chmod 440 /etc/sudoers.d/kolla_glance_sudoers \
    && touch /usr/local/bin/kolla_glance_extend_start \
    && chmod 755 /usr/local/bin/kolla_extend_start /usr/local/bin/kolla_glance_extend_start
