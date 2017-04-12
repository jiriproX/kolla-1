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

FROM intelonp/centos-source-base:0017
MAINTAINER Intel Corp. (http://www.intel.com)








RUN yum -y install redhat-rpm-config redhat-lsb-core pciutils autoconf libtool fuse-devel gcc make autoconf automake libpcap-devel python-devel python-six && yum clean all

RUN mkdir -p /ovsdpdk-source && git clone https://github.com/openvswitch/ovs /ovsdpdk-source/ovsdpdk && pushd /ovsdpdk-source/ovsdpdk && git checkout f4b0e64cffb4777ff03d48621c3eadcf1d8c19f3 && popd

RUN mkdir -p /plugins && git clone http://dpdk.org/git/dpdk /plugins/ovsdpdk-plugin-dpdk-archive-ph && pushd /plugins/ovsdpdk-plugin-dpdk-archive-ph && git checkout d3bfeaaabfd37ecc7d7d2edf2a3b60cc2d913cc9 && popd 

RUN ln -s /ovsdpdk-source/* /ovs && ln -s /plugins/ovsdpdk-plugin-dpdk-archive-*/ /dpdk
WORKDIR /dpdk

RUN make config T="x86_64-native-linuxapp-gcc"
WORKDIR "/dpdk/build"

RUN /bin/true ;  sed -i "/dpdk/build/.config" -e "s/CONFIG_RTE_BUILD_COMBINE_LIBS=n/CONFIG_RTE_BUILD_COMBINE_LIBS=y/" &&  sed -i "/dpdk/build/.config" -e "s/CONFIG_RTE_MAX_MEMSEG=.*$/CONFIG_RTE_MAX_MEMSEG=1024/" &&  sed -i "/dpdk/build/.config" -e "s/CONFIG_RTE_LIBRTE_VHOST=.*$/CONFIG_RTE_LIBRTE_VHOST=y/" &&  sed -i "/dpdk/build/.config" -e "s/CONFIG_RTE_LIBRTE_KNI=.*$/CONFIG_RTE_LIBRTE_KNI=n/" &&  sed -i "/dpdk/build/.config" -e "s/CONFIG_RTE_KNI_KMOD=.*$/CONFIG_RTE_KNI_KMOD=n/" &&  sed -i "/dpdk/build/.config" -e "s/CONFIG_RTE_EAL_IGB_UIO=.*$/CONFIG_RTE_EAL_IGB_UIO=$y/" &&  sed -i "/dpdk/build/.config" -e "s/CONFIG_RTE_BUILD_SHARED_LIB=.*$/CONFIG_RTE_BUILD_SHARED_LIB=n/" &&  /bin/true

RUN make -j $(nproc) EXTRA_CFLAGS='-fPIC' && \
    make install

RUN cd /ovs && \
    ./boot.sh && \
    bash -c 'CFLAGS="$(rpm --eval '%optflags') -O3 -fPIC" LDFLAGS="" ./configure --with-dpdk="/dpdk/build" --prefix=/usr --with-dbdir=/etc/openvswitch --with-rundir=/run/openvswitch' && \
    make -j $(nproc) && \
    make install




COPY extend_start.sh /usr/local/bin/kolla_extend_start
RUN chmod 755 /usr/local/bin/kolla_extend_start
