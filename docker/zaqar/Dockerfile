FROM intelonp/centos-source-openstack-base:2.4.20170321
MAINTAINER Intel Corp. (http://www.intel.com)








RUN usermod --append --home /var/lib/zaqar --groups kolla zaqar \
    && mkdir -p /var/lib/zaqar \
    && chown -R 42452:42452 /var/lib/zaqar



RUN mkdir -p /zaqar-source && git clone git://git.openstack.org/openstack/zaqar /zaqar-source/zaqar && pushd /zaqar-source/zaqar && git checkout f196f9a8a92bb7206ef64e8bba151ba659c3aab6 && popd

RUN ln -s zaqar-source/* zaqar \
    && /var/lib/kolla/venv/bin/pip --no-cache-dir install --upgrade -c requirements/upper-constraints.txt pymongo /zaqar \
    && mkdir -p /etc/zaqar \
    && cp -r /zaqar/etc/* /etc/zaqar/ \
    && mv /etc/zaqar/policy.json.sample /etc/zaqar/policy.json \
    && chown -R zaqar: /etc/zaqar



COPY extend_start.sh /usr/local/bin/kolla_extend_start
RUN chmod 755 /usr/local/bin/kolla_extend_start




USER zaqar