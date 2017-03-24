FROM intelonp/centos-source-openstack-base:17.04.0-test
MAINTAINER Intel Corp. (http://www.intel.com)








RUN usermod --append --home /var/lib/cloudkitty --groups kolla cloudkitty \
    && mkdir -p /var/lib/cloudkitty \
    && chown -R 42408:42408 /var/lib/cloudkitty




RUN mkdir -p /cloudkitty-base-source && git clone git://git.openstack.org/openstack/cloudkitty /cloudkitty-base-source/cloudkitty-base && pushd /cloudkitty-base-source/cloudkitty-base && git checkout 31845a888f7adf992667e5753ca45149ba5f13eb && popd

RUN ln -s cloudkitty-base-source/* cloudkitty \
    && /var/lib/kolla/venv/bin/pip --no-cache-dir install --upgrade -c requirements/upper-constraints.txt /cloudkitty \
    && mkdir -p /etc/cloudkitty  \
    && cp -r /cloudkitty/etc/cloudkitty/* /etc/cloudkitty/ \
    && chown -R cloudkitty: /etc/cloudkitty



COPY extend_start.sh /usr/local/bin/kolla_extend_start

RUN touch /usr/local/bin/kolla_cloudkitty_extend_start \
    && chmod 755 /usr/local/bin/kolla_extend_start /usr/local/bin/kolla_cloudkitty_extend_start
