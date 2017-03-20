FROM intelonp/centos-source-openstack-base:2.4.20170320
MAINTAINER Intel Corp. (http://www.intel.com)








RUN usermod --append --home /var/lib/murano --groups kolla murano \
    && mkdir -p /var/lib/murano \
    && chown -R 42433:42433 /var/lib/murano




RUN mkdir -p /murano-base-source && git clone git://git.openstack.org/openstack/murano /murano-base-source/murano-base && pushd /murano-base-source/murano-base && git checkout fbee4043ee1c269d90c8ec2c1f275f02f43cd4fd && popd

RUN ln -s murano-base-source/* murano \
    && /var/lib/kolla/venv/bin/pip --no-cache-dir install --upgrade -c requirements/upper-constraints.txt /murano \
    && mkdir -p /etc/murano \
    && cp -r /murano/etc/murano/* /etc/murano/ \
    && chown -R murano: /etc/murano \
    && cd murano/meta/io.murano \
    && zip -r /io.murano.zip *



COPY extend_start.sh /usr/local/bin/kolla_extend_start

RUN touch /usr/local/bin/kolla_murano_extend_start \
    && chmod 755 /usr/local/bin/kolla_extend_start /usr/local/bin/kolla_murano_extend_start
