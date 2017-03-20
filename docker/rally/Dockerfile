FROM intelonp/centos-source-openstack-base:2.4.20170320
MAINTAINER Intel Corp. (http://www.intel.com)








RUN usermod --append --home /var/lib/rally --groups kolla rally \
    && mkdir -p /var/lib/rally \
    && chown -R 42440:42440 /var/lib/rally




RUN mkdir -p /rally-source && git clone git://git.openstack.org/openstack/rally /rally-source/rally && pushd /rally-source/rally && git checkout 91f22381a2b2f4e9850821c138a8930e2c4d2167 && popd

RUN ln -s rally-source/* rally \
    && /var/lib/kolla/venv/bin/pip --no-cache-dir install --upgrade -c requirements/upper-constraints.txt /rally \
    && mkdir -p /etc/rally \
    && chown -R rally: /etc/rally



COPY extend_start.sh /usr/local/bin/kolla_extend_start
RUN chmod 755 /usr/local/bin/kolla_extend_start




USER rally