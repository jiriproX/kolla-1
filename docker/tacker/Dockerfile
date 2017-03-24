FROM intelonp/centos-source-openstack-base:17.04.0-test
MAINTAINER Intel Corp. (http://www.intel.com)








RUN usermod --append --home /var/lib/tacker --groups kolla tacker \
    && mkdir -p /var/lib/tacker \
    && chown -R 42446:42446 /var/lib/tacker




RUN mkdir -p /tacker-source && git clone http://tarballs.openstack.org/tacker/tacker-master.tar.gz /tacker-source/tacker && pushd /tacker-source/tacker && git checkout None && popd

RUN ln -s tacker-source/* tacker \
    && /var/lib/kolla/venv/bin/pip --no-cache-dir install --upgrade -c requirements/upper-constraints.txt /tacker \
    && mkdir -p /etc/tacker \
    && cp -r /tacker/etc/tacker/* /etc/tacker \
    && chown -R tacker: /etc/tacker



COPY extend_start.sh /usr/local/bin/kolla_extend_start

RUN chmod 755 /usr/local/bin/kolla_extend_start




USER tacker