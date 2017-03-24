FROM intelonp/centos-source-openstack-base:17.04.0-test
MAINTAINER Intel Corp. (http://www.intel.com)








RUN usermod --append --home /var/lib/ceilometer --groups kolla ceilometer \
    && mkdir -p /var/lib/ceilometer \
    && chown -R 42405:42405 /var/lib/ceilometer




RUN mkdir -p /ceilometer-base-source && git clone git://git.openstack.org/openstack/ceilometer /ceilometer-base-source/ceilometer-base && pushd /ceilometer-base-source/ceilometer-base && git checkout 9cfd46c2e4c6cda85d1de118a349b2a9f7440d0c && popd

RUN ln -s ceilometer-base-source/* ceilometer \
    && /var/lib/kolla/venv/bin/pip --no-cache-dir install --upgrade -c requirements/upper-constraints.txt /ceilometer[gnocchi,mongo,mysql] \
    && mkdir -p /etc/ceilometer \
    && cp -r /ceilometer/etc/ceilometer/* /etc/ceilometer/ \
    && chown -R ceilometer: /etc/ceilometer \
    && sed -i 's|^exec_dirs.*|exec_dirs=/var/lib/kolla/venv/bin,/sbin,/usr/sbin,/bin,/usr/bin,/usr/local/bin,/usr/local/sbin|g' /etc/ceilometer/rootwrap.conf



COPY ceilometer_sudoers /etc/sudoers.d/kolla_ceilometer_sudoers
COPY extend_start.sh /usr/local/bin/kolla_extend_start

RUN chmod 750 /etc/sudoers.d \
    && chmod 440 /etc/sudoers.d/kolla_ceilometer_sudoers \
    && touch /usr/local/bin/kolla_ceilometer_extend_start \
    && chmod 755 /usr/local/bin/kolla_extend_start /usr/local/bin/kolla_ceilometer_extend_start
