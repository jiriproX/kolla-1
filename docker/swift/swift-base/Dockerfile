FROM intelonp/centos-source-openstack-base:2.3.201610190134
MAINTAINER Intel Corp. (http://www.intel.com)






    
        
    

RUN yum -y install liberasurecode-devel && yum clean all
RUN mkdir -p /swift-base-source && git clone git://git.openstack.org/openstack/swift /swift-base-source/swift-base && pushd /swift-base-source/swift-base && git checkout 6bf63d85a7c7c5e444a20176a6c51a7f3941c93f && popd

RUN ln -s swift-base-source/* swift \
    && useradd --user-group swift \
    && /var/lib/kolla/venv/bin/pip --no-cache-dir install --upgrade -c requirements/upper-constraints.txt /swift \
    && mkdir -p /etc/swift /var/cache/swift /var/log/swift /home/swift \
    && cp -r /swift/etc/* /etc/swift/ \
    && chown -R swift: /etc/swift /var/cache/swift /var/log/swift /home/swift



RUN pip install oslo.rootwrap

COPY swift-rootwrap /var/lib/kolla/venv/bin/swift-rootwrap
COPY rootwrap.conf /etc/swift/rootwrap.conf
RUN chmod 755 /var/lib/kolla/venv/bin/swift-rootwrap \
    && chmod 644 /etc/swift/rootwrap.conf \
    && sed -i 's|^exec_dirs.*|exec_dirs=/var/lib/kolla/venv/bin,/sbin,/usr/sbin,/bin,/usr/bin,/usr/local/bin,/usr/local/sbin|g' /etc/swift/rootwrap.conf

COPY swift_sudoers /etc/sudoers.d/kolla_swift_sudoers
RUN chmod 750 /etc/sudoers.d \
    && chmod 440 /etc/sudoers.d/kolla_swift_sudoers

COPY build-swift-ring.py /usr/local/bin/kolla_build_swift_ring
RUN mkdir -p /opt/swift

RUN usermod -a -G kolla swift

