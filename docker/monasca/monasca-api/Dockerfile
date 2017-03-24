FROM intelonp/centos-source-monasca-base:2.4.201703130523
MAINTAINER Intel Corp. (http://www.intel.com)







RUN mkdir -p /monasca-api-source && git clone http://tarballs.openstack.org/monasca-api/monasca-api-1.3.1.tar.gz /monasca-api-source/monasca-api && pushd /monasca-api-source/monasca-api && git checkout None && popd

RUN ln -s monasca-api-source/* monasca-api \
    && /var/lib/kolla/venv/bin/pip --no-cache-dir install --upgrade -c requirements/upper-constraints.txt /monasca-api







USER monasca