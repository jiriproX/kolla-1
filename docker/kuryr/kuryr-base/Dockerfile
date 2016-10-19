FROM intelonp/centos-source-openstack-base:2.3.201610190134
MAINTAINER Intel Corp. (http://www.intel.com)



RUN mkdir -p /kuryr-base-source && git clone git://git.openstack.org/openstack/kuryr /kuryr-base-source/kuryr-base && pushd /kuryr-base-source/kuryr-base && git checkout 31325bd85a1f9415e084f0a8df5fc4c0052f7542 && popd

RUN ln -s kuryr-base-source/* kuryr-base \
    && /var/lib/kolla/venv/bin/pip --no-cache-dir install --upgrade -c requirements/upper-constraints.txt /kuryr-base



COPY extend_start.sh /usr/local/bin/kolla_extend_start
