FROM intelonp/centos-source-openstack-base:2.4.20170321
MAINTAINER Intel Corp. (http://www.intel.com)








RUN usermod --append --home /var/lib/magnum --groups kolla magnum \
    && mkdir -p /var/lib/magnum \
    && chown -R 42428:42428 /var/lib/magnum




RUN mkdir -p /magnum-base-source && git clone git://git.openstack.org/openstack/magnum /magnum-base-source/magnum-base && pushd /magnum-base-source/magnum-base && git checkout 5cbb881c50964f0aef320ef1631870fcc2eba6f7 && popd

RUN ln -s magnum-base-source/* magnum \
    && /var/lib/kolla/venv/bin/pip --no-cache-dir install --upgrade -c requirements/upper-constraints.txt /magnum[osprofiler] \
    && mkdir -p /etc/magnum \
    && cp -r /magnum/etc/magnum/* /etc/magnum \
    && chown -R magnum: /etc/magnum



COPY extend_start.sh /usr/local/bin/kolla_extend_start

RUN touch /usr/local/bin/kolla_magnum_extend_start \
    && chmod 755 /usr/local/bin/kolla_extend_start /usr/local/bin/kolla_magnum_extend_start