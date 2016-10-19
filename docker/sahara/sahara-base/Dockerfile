FROM intelonp/centos-source-openstack-base:2.3.201610190134
MAINTAINER Intel Corp. (http://www.intel.com)







RUN mkdir -p /sahara-base-source && git clone git://git.openstack.org/openstack/sahara /sahara-base-source/sahara-base && pushd /sahara-base-source/sahara-base && git checkout cbd51fa579274dd4621708286ac8a2289aabfc41 && popd

RUN ln -s sahara-base-source/* sahara \
    && useradd --user-group sahara \
    && /var/lib/kolla/venv/bin/pip --no-cache-dir install --upgrade -c requirements/upper-constraints.txt /sahara \
    && mkdir -p /etc/sahara /var/log/sahara /home/sahara \
    && cp -r /sahara/etc/sahara/* /etc/sahara/ \
    && chown -R sahara: /etc/sahara /var/log/sahara /home/sahara \
    && sed -i 's|^exec_dirs.*|exec_dirs=/var/lib/kolla/venv/bin,/sbin,/usr/sbin,/bin,/usr/bin,/usr/local/bin,/usr/local/sbin|g' /etc/sahara/rootwrap.conf



RUN usermod -a -G kolla sahara

COPY sahara_sudoers /etc/sudoers.d/kolla_sahara_sudoers
COPY extend_start.sh /usr/local/bin/kolla_extend_start

RUN usermod -a -G kolla sahara \
    && chmod 750 /etc/sudoers.d \
    && chmod 640 /etc/sudoers.d/kolla_sahara_sudoers \
    && touch /usr/local/bin/kolla_sahara_extend_start \
    && chmod 755 /usr/local/bin/kolla_extend_start /usr/local/bin/kolla_sahara_extend_start
