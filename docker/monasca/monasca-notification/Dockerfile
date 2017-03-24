FROM intelonp/centos-source-monasca-base:17.04.0
MAINTAINER Intel Corp. (http://www.intel.com)







RUN mkdir -p /monasca-notification-source && git clone http://tarballs.openstack.org/monasca-notification/monasca-notification-1.4.0.tar.gz /monasca-notification-source/monasca-notification && pushd /monasca-notification-source/monasca-notification && git checkout None && popd

RUN ln -s monasca-notification-source/* monasca-notification \
    && /var/lib/kolla/venv/bin/pip --no-cache-dir install --upgrade -c requirements/upper-constraints.txt /monasca-notification







USER monasca