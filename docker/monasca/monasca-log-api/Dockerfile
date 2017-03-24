FROM intelonp/centos-source-monasca-base:17.04.0
MAINTAINER Intel Corp. (http://www.intel.com)







RUN mkdir -p /monasca-log-api-source && git clone http://tarballs.openstack.org/monasca-log-api/monasca-log-api-1.1.0.tar.gz /monasca-log-api-source/monasca-log-api && pushd /monasca-log-api-source/monasca-log-api && git checkout None && popd

RUN ln -s monasca-log-api-source/* monasca-log \
    && /var/lib/kolla/venv/bin/pip --no-cache-dir install --upgrade -c requirements/upper-constraints.txt /monasca-log







USER monasca