FROM intelonp/centos-source-monasca-base:2.4.20170320
MAINTAINER Intel Corp. (http://www.intel.com)







RUN mkdir -p /monasca-persister-source && git clone http://tarballs.openstack.org/monasca-persister/monasca-persister-1.1.0.tar.gz /monasca-persister-source/monasca-persister && pushd /monasca-persister-source/monasca-persister && git checkout None && popd

RUN ln -s monasca-persister-source/* monasca-persister \
    && /var/lib/kolla/venv/bin/pip --no-cache-dir install --upgrade -c requirements/upper-constraints.txt /monasca-persister







USER monasca