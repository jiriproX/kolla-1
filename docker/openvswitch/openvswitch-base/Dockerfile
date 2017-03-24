FROM intelonp/centos-source-base:17.04.0
MAINTAINER Intel Corp. (http://www.intel.com)






    


RUN yum -y install redhat-rpm-config redhat-lsb-core pciutils autoconf libtool fuse-devel gcc make autoconf automake libpcap-devel python-devel python-six && yum clean all

COPY extend_start.sh /usr/local/bin/kolla_extend_start

RUN touch /usr/local/bin/kolla_openvswitch_extend_start \
    && chmod 755 /usr/local/bin/kolla_extend_start /usr/local/bin/kolla_openvswitch_extend_start


RUN mkdir -p /openvswitch-base-source && git clone https://github.com/openvswitch/ovs /openvswitch-base-source/openvswitch-base && pushd /openvswitch-base-source/openvswitch-base && git checkout f4b0e64cffb4777ff03d48621c3eadcf1d8c19f3 && popd

RUN ln -s /openvswitch-base-source/* /ovs

RUN cd /ovs && \
    ./boot.sh && \
    bash -c 'CFLAGS="$(rpm --eval '%optflags') -O3 -fPIC" LDFLAGS="" ./configure  --prefix=/usr --with-dbdir=/etc/openvswitch --with-rundir=/run/openvswitch' && \
    make -j $(nproc) && \
    make install
