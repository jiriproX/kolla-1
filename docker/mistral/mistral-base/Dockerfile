FROM intelonp/centos-source-openstack-base:2.4.201703130523
MAINTAINER Intel Corp. (http://www.intel.com)








RUN usermod --append --home /var/lib/mistral --groups kolla mistral \
    && mkdir -p /var/lib/mistral \
    && chown -R 42430:42430 /var/lib/mistral




RUN mkdir -p /mistral-base-source && git clone git://git.openstack.org/openstack/mistral /mistral-base-source/mistral-base && pushd /mistral-base-source/mistral-base && git checkout b8927d8a94a565663ff1ee6f1cb696f56b2ede75 && popd

RUN ln -s mistral-base-source/* mistral \
    && /var/lib/kolla/venv/bin/pip --no-cache-dir install /mistral \
    && mkdir -p /etc/mistral \
    && cp -r /mistral/etc/* /etc/mistral/ \
    && chown -R mistral: /etc/mistral



COPY extend_start.sh /usr/local/bin/kolla_extend_start

RUN touch /usr/local/bin/kolla_mistral_extend_start \
    && chmod 755 /usr/local/bin/kolla_extend_start /usr/local/bin/kolla_mistral_extend_start