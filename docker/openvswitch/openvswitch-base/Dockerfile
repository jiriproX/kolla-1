# Copyright (c) 2017, Intel Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FROM intelonp/centos-source-base:0018
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
