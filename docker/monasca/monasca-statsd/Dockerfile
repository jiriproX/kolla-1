FROM intelonp/centos-source-monasca-base:2.4.201703130523
MAINTAINER Intel Corp. (http://www.intel.com)







RUN mkdir -p /monasca-statsd-source && git clone http://tarballs.openstack.org/monasca-statsd/monasca-statsd-1.3.0.tar.gz /monasca-statsd-source/monasca-statsd && pushd /monasca-statsd-source/monasca-statsd && git checkout None && popd

# NOTE(SamYaple): <=1.3.0 do not have any packages in requirements.txt and that
# breaks pip. So removing constraints file.
RUN ln -s monasca-statsd-source/* monasca-statsd \
    && /var/lib/kolla/venv/bin/pip --no-cache-dir install --upgrade /monasca-statsd







USER monasca