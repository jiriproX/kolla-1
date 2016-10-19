FROM intelonp/centos-source-openstack-base:2.3.201610190134
MAINTAINER Intel Corp. (http://www.intel.com)







RUN mkdir -p /rally-source && git clone git://git.openstack.org/openstack/rally /rally-source/rally && pushd /rally-source/rally && git checkout d599de9a2653645cfd1d9f697c3eb3c386587241 && popd

RUN ln -s rally-source/* rally \
    && useradd --user-group rally \
    && /var/lib/kolla/venv/bin/pip --no-cache-dir install --upgrade -c requirements/upper-constraints.txt /rally \
    && mkdir -p /etc/rally /var/log/rally /home/rally \
    && chown -R rally: /etc/rally /var/log/rally /home/rally



COPY extend_start.sh /usr/local/bin/kolla_extend_start
RUN chmod 755 /usr/local/bin/kolla_extend_start

RUN usermod -a -G kolla rally





USER rally