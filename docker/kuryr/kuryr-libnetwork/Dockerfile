FROM intelonp/centos-source-kuryr-base:2.3.201610190134
MAINTAINER Intel Corp. (http://www.intel.com)



RUN mkdir -p /kuryr-libnetwork-source && git clone git://git.openstack.org/openstack/kuryr-libnetwork /kuryr-libnetwork-source/kuryr-libnetwork && pushd /kuryr-libnetwork-source/kuryr-libnetwork && git checkout 9dd929d006762579b48b274a861372bafda4689f && popd

RUN ln -s kuryr-libnetwork-source/* kuryr-libnetwork \
    && /var/lib/kolla/venv/bin/pip --no-cache-dir install --upgrade -c requirements/upper-constraints.txt /kuryr-libnetwork




