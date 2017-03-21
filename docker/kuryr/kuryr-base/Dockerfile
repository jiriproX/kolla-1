FROM intelonp/centos-source-openstack-base:2.4.20170321
MAINTAINER Intel Corp. (http://www.intel.com)





RUN mkdir -p /kuryr-base-source && git clone git://git.openstack.org/openstack/kuryr /kuryr-base-source/kuryr-base && pushd /kuryr-base-source/kuryr-base && git checkout d4e71a37947a15229991cee610d1c678b77969f1 && popd

# NOTE(Jeffrey4l): remove kuryr-lib constraint in upper-constraints.txt file.
# Otherwise, it will be failed.
RUN ln -s kuryr-base-source/* kuryr-base \
    && sed -i 's|^kuryr-lib===.*$||g' requirements/upper-constraints.txt \
    && /var/lib/kolla/venv/bin/pip --no-cache-dir install --upgrade -c requirements/upper-constraints.txt /kuryr-base



COPY extend_start.sh /usr/local/bin/kolla_extend_start
RUN chmod 755 /usr/local/bin/kolla_extend_start
