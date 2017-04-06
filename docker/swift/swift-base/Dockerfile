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

FROM intelonp/centos-source-openstack-base:test_1
MAINTAINER Intel Corp. (http://www.intel.com)








RUN usermod --append --home /var/lib/swift --groups kolla swift \
    && mkdir -p /var/lib/swift \
    && chown -R 42445:42445 /var/lib/swift



    
        
    

RUN yum -y install liberasurecode-devel && yum clean all

RUN mkdir -p /swift-base-source && git clone git://git.openstack.org/openstack/swift /swift-base-source/swift-base && pushd /swift-base-source/swift-base && git checkout 11bd6c82ecac8572cf9538a4d92a0361b382f1de && popd

RUN ln -s swift-base-source/* swift \
    && /var/lib/kolla/venv/bin/pip --no-cache-dir install --upgrade -c requirements/upper-constraints.txt /swift \
    && mkdir -p /etc/swift /var/cache/swift \
    && cp -r /swift/etc/* /etc/swift/ \
    && chown -R swift: /etc/swift /var/cache/swift


COPY swift-rootwrap /var/lib/kolla/venv/bin/swift-rootwrap
COPY rootwrap.conf /etc/swift/rootwrap.conf
COPY swift_sudoers /etc/sudoers.d/kolla_swift_sudoers
COPY build-swift-ring.py /usr/local/bin/kolla_build_swift_ring

RUN chmod 755 /var/lib/kolla/venv/bin/swift-rootwrap \
    && chmod 644 /etc/swift/rootwrap.conf \
    && sed -i 's|^exec_dirs.*|exec_dirs=/var/lib/kolla/venv/bin,/sbin,/usr/sbin,/bin,/usr/bin,/usr/local/bin,/usr/local/sbin|g' /etc/swift/rootwrap.conf \
    && chmod 750 /etc/sudoers.d \
    && chmod 440 /etc/sudoers.d/kolla_swift_sudoers \
    && mkdir -p /opt/swift
