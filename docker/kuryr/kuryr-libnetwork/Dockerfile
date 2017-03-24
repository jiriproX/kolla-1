FROM intelonp/centos-source-kuryr-base:2.4.201703130523
MAINTAINER Intel Corp. (http://www.intel.com)





RUN mkdir -p /kuryr-libnetwork-source && git clone git://git.openstack.org/openstack/kuryr-libnetwork /kuryr-libnetwork-source/kuryr-libnetwork && pushd /kuryr-libnetwork-source/kuryr-libnetwork && git checkout 9e99cc02428836a688926a44a6faf1b3414ffde3 && popd

RUN ln -s kuryr-libnetwork-source/* kuryr-libnetwork \
    && /var/lib/kolla/venv/bin/pip --no-cache-dir install --upgrade -c requirements/upper-constraints.txt /kuryr-libnetwork



