FROM intelonp/centos-source-openstack-base:17.04.0-test
MAINTAINER Intel Corp. (http://www.intel.com)


RUN mkdir -p /var/lib/collectd /etc/collectd







RUN usermod --append --home /var/lib/collectd --groups kolla collectd \
    && mkdir -p /var/lib/collectd \
    && chown -R 42409:42409 /var/lib/collectd



RUN yum -y install redhat-rpm-config redhat-lsb-core pciutils autoconf libtool fuse-devel gcc make autoconf automake bison flex libpcap-devel python-devel python-six libtool-ltdl-devel perl-devel && yum clean all

COPY extend_start.sh /usr/local/bin/kolla_extend_start
RUN chmod 755 /usr/local/bin/kolla_extend_start \
    && chown -R collectd /var/lib/collectd \
    && chown -R collectd /etc/collectd* \
    && chown -R collectd /var/run/


RUN mkdir -p /collectd-source && git clone https://github.com/collectd/collectd /collectd-source/collectd && pushd /collectd-source/collectd && git checkout 0c157068b398f336b6478cb24fa05243b49fcda4 && popd

RUN mkdir -p /plugins && git clone http://git.openstack.org/openstack/collectd-ceilometer-plugin /plugins/collectd-plugin-collecd-ceilometer-archive-ph && pushd /plugins/collectd-plugin-collecd-ceilometer-archive-ph && git checkout 911961d18a54a10f004d942f5214b10facdc8b98 && popd

RUN ln -s /collectd-source/* /collectd && ln -s /plugins/collectd-plugin-collecd-ceilometer-archive-*/ /collectd-ceilometer-plugin
RUN cd /collectd && \
    ./build.sh && \
    bash -c 'CFLAGS="$(rpm --eval '%optflags') -O3 -fPIC" LDFLAGS="" ./configure --enable-syslog --enable-plugin --enable-logfile --enable-debug --prefix=/usr' && \
    make -j $(nproc) && \
    make install && \
    chown -R collectd /var/lib/collectd && \
    chown -R collectd /etc/collectd* && \
    chown -R collectd /var/run/



USER collectd