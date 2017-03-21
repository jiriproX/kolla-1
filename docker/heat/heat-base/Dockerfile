FROM intelonp/centos-source-openstack-base:2.4.20170321
MAINTAINER Intel Corp. (http://www.intel.com)








RUN usermod --append --home /var/lib/heat --groups kolla heat \
    && mkdir -p /var/lib/heat \
    && chown -R 42418:42418 /var/lib/heat




RUN mkdir -p /heat-base-source && git clone git://git.openstack.org/openstack/heat /heat-base-source/heat-base && pushd /heat-base-source/heat-base && git checkout 2dd83353c086a8ee3ee8aefb99b06832782d8cab && popd

RUN ln -s heat-base-source/* heat \
    && /var/lib/kolla/venv/bin/pip --no-cache-dir install --upgrade -c requirements/upper-constraints.txt /heat \
    && mkdir -p /etc/heat \
    && cp -r /heat/etc/heat/* /etc/heat/ \
    && chown -R heat: /etc/heat



COPY extend_start.sh /usr/local/bin/kolla_extend_start

RUN touch /usr/local/bin/kolla_heat_extend_start \
    && chmod 755 /usr/local/bin/kolla_extend_start /usr/local/bin/kolla_heat_extend_start
