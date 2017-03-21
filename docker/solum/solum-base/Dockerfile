FROM intelonp/centos-source-openstack-base:2.4.20170321
MAINTAINER Intel Corp. (http://www.intel.com)








RUN usermod --append --home /var/lib/solum --groups kolla solum \
    && mkdir -p /var/lib/solum \
    && chown -R 42444:42444 /var/lib/solum




RUN mkdir -p /solum-base-source && git clone http://tarballs.openstack.org/solum/solum-master.tar.gz /solum-base-source/solum-base && pushd /solum-base-source/solum-base && git checkout None && popd

RUN ln -s solum-base-source/* solum \
    && /var/lib/kolla/venv/bin/pip --no-cache-dir install --upgrade -c requirements/upper-constraints.txt /solum \
    && mkdir -p /etc/solum \
    && cp -r /solum/etc/solum/* /etc/solum/ \
    && chown -R solum: /etc/solum



COPY extend_start.sh /usr/local/bin/kolla_extend_start

RUN touch /usr/local/bin/kolla_solum_extend_start \
    && chmod 755 /usr/local/bin/kolla_extend_start /usr/local/bin/kolla_solum_extend_start
