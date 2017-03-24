FROM intelonp/centos-source-openstack-base:2.4.201703130523
MAINTAINER Intel Corp. (http://www.intel.com)








RUN usermod --append --home /var/lib/trove --groups kolla trove \
    && mkdir -p /var/lib/trove \
    && chown -R 42449:42449 /var/lib/trove




RUN mkdir -p /trove-base-source && git clone git://git.openstack.org/openstack/trove /trove-base-source/trove-base && pushd /trove-base-source/trove-base && git checkout 60e35d16b5d944d708f781271d63ce17df31df4e && popd

RUN ln -s trove-base-source/* trove \
    && /var/lib/kolla/venv/bin/pip --no-cache-dir install --upgrade -c requirements/upper-constraints.txt /trove \
    && mkdir -p /etc/trove \
    && cp -r /trove/etc/trove/* /etc/trove/ \
    && chown -R trove: /etc/trove



COPY extend_start.sh /usr/local/bin/kolla_extend_start

RUN touch /usr/local/bin/kolla_trove_extend_start \
    && chmod 755 /usr/local/bin/kolla_extend_start /usr/local/bin/kolla_trove_extend_start
