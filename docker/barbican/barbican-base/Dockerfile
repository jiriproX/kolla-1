FROM intelonp/centos-source-openstack-base:2.4.20170321
MAINTAINER Intel Corp. (http://www.intel.com)








RUN usermod --append --home /var/lib/barbican --groups kolla barbican \
    && mkdir -p /var/lib/barbican \
    && chown -R 42403:42403 /var/lib/barbican



    
        
    

RUN yum -y install uwsgi-plugin-python && yum clean all

RUN mkdir -p /barbican-base-source && git clone git://git.openstack.org/openstack/barbican /barbican-base-source/barbican-base && pushd /barbican-base-source/barbican-base && git checkout d0ebc6c321a840c2d3c8ae5a682d721da7b4a239 && popd

RUN ln -s barbican-base-source/* barbican \
    && /var/lib/kolla/venv/bin/pip --no-cache-dir install --upgrade -c requirements/upper-constraints.txt  pastedeploy uwsgi MySQL-python python-barbicanclient /barbican \
    && mkdir -p /etc/barbican \
    && cp -r /barbican/etc/barbican/* /etc/barbican/ \
    && chown -R barbican: /etc/barbican



COPY barbican_sudoers /etc/sudoers.d/kolla_barbican_sudoers
COPY extend_start.sh /usr/local/bin/kolla_extend_start

RUN chmod 750 /etc/sudoers.d \
    && chmod 640 /etc/sudoers.d/kolla_barbican_sudoers \
    && touch /usr/local/bin/kolla_barbican_extend_start \
    && chmod 755 /usr/local/bin/kolla_extend_start /usr/local/bin/kolla_barbican_extend_start
