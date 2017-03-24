FROM intelonp/centos-source-openstack-base:2.4.201703130523
MAINTAINER Intel Corp. (http://www.intel.com)








RUN usermod --append --home /var/lib/searchlight --groups kolla searchlight \
    && mkdir -p /var/lib/searchlight \
    && chown -R 42442:42442 /var/lib/searchlight




RUN mkdir -p /searchlight-base-source && git clone http://tarballs.openstack.org/searchlight/searchlight-1.0.0.tar.gz /searchlight-base-source/searchlight-base && pushd /searchlight-base-source/searchlight-base && git checkout None && popd

RUN ln -s searchlight-base-source/* searchlight \
    && /var/lib/kolla/venv/bin/pip --no-cache-dir install --upgrade -c requirements/upper-constraints.txt /searchlight \
    && mkdir -p /etc/searchlight \
    && cp -r /searchlight/etc/* /etc/searchlight \
    && chown -R searchlight: /etc/searchlight



COPY extend_start.sh /usr/local/bin/kolla_extend_start

RUN touch /usr/local/bin/kolla_searchlight_extend_start \
    && chmod 755 /usr/local/bin/kolla_extend_start /usr/local/bin/kolla_searchlight_extend_start
