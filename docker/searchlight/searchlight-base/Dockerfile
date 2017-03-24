FROM intelonp/centos-source-openstack-base:17.04.0
MAINTAINER Intel Corp. (http://www.intel.com)








RUN usermod --append --home /var/lib/searchlight --groups kolla searchlight \
    && mkdir -p /var/lib/searchlight \
    && chown -R 42442:42442 /var/lib/searchlight




RUN mkdir -p /searchlight-base-source && git clone https://github.com/openstack/searchlight -b stable/ocata /searchlight-base-source/searchlight-base 

RUN ln -s searchlight-base-source/* searchlight \
    && /var/lib/kolla/venv/bin/pip --no-cache-dir install --upgrade -c requirements/upper-constraints.txt /searchlight \
    && mkdir -p /etc/searchlight \
    && cp -r /searchlight/etc/* /etc/searchlight \
    && chown -R searchlight: /etc/searchlight



COPY extend_start.sh /usr/local/bin/kolla_extend_start

RUN touch /usr/local/bin/kolla_searchlight_extend_start \
    && chmod 755 /usr/local/bin/kolla_extend_start /usr/local/bin/kolla_searchlight_extend_start
