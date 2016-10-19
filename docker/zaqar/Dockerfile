FROM intelonp/centos-source-openstack-base:2.3.201610190134
MAINTAINER Intel Corp. (http://www.intel.com)







RUN mkdir -p /zaqar-source && git clone git://git.openstack.org/openstack/zaqar /zaqar-source/zaqar && pushd /zaqar-source/zaqar && git checkout 3ef0881e089e62ab094a77dc1a1121797171cdef && popd

RUN ln -s zaqar-source/* zaqar \
    && useradd --user-group zaqar \
    && /var/lib/kolla/venv/bin/pip --no-cache-dir install --upgrade -c requirements/upper-constraints.txt /zaqar \
    && mkdir -p /etc/zaqar /var/log/zaqar /home/zaqar \
    && cp -r /zaqar/etc/* /etc/zaqar/ \
    && chown -R zaqar: /etc/zaqar /var/log/zaqar /home/zaqar



COPY extend_start.sh /usr/local/bin/kolla_extend_start
RUN chmod 755 /usr/local/bin/kolla_extend_start \
    && usermod -a -G kolla zaqar





USER zaqar