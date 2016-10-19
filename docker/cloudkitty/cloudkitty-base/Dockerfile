FROM intelonp/centos-source-openstack-base:2.3.201610190134
MAINTAINER Intel Corp. (http://www.intel.com)







RUN mkdir -p /cloudkitty-base-source && git clone git://git.openstack.org/openstack/cloudkitty /cloudkitty-base-source/cloudkitty-base && pushd /cloudkitty-base-source/cloudkitty-base && git checkout 772ba65266708fb0945842f68a39bc2ebcc9ef67 && popd

RUN ln -s cloudkitty-base-source/* cloudkitty \
    && useradd --user-group cloudkitty \
    && /var/lib/kolla/venv/bin/pip --no-cache-dir install --upgrade -c requirements/upper-constraints.txt /cloudkitty \
    && mkdir -p /etc/cloudkitty /var/lib/cloudkitty /home/cloudkitty \
    && cp -r /cloudkitty/etc/cloudkitty/* /etc/cloudkitty/ \
    && chown -R cloudkitty: /etc/cloudkitty /var/lib/cloudkitty /home/cloudkitty



COPY extend_start.sh /usr/local/bin/kolla_extend_start

RUN usermod -a -G kolla cloudkitty \
    && touch /usr/local/bin/kolla_cloudkitty_extend_start \
    && chmod 755 /usr/local/bin/kolla_extend_start /usr/local/bin/kolla_cloudkitty_extend_start
