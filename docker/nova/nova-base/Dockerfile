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

FROM intelonp/centos-source-openstack-base:0015
MAINTAINER Intel Corp. (http://www.intel.com)








RUN usermod --append --home /var/lib/nova --groups kolla nova \
    && usermod --append --groups qemu nova \
    && mkdir -p /var/lib/nova \
    && chown -R 42436:42436 /var/lib/nova



    

        

    

RUN yum -y install bridge-utils && yum clean all

RUN mkdir -p /nova-base-source && git clone git://git.openstack.org/openstack/nova /nova-base-source/nova-base && pushd /nova-base-source/nova-base && git checkout ff369899749ac3e21ed0174b40e948c78c2dc1fa && popd

RUN ln -s nova-base-source/* nova \
    && /var/lib/kolla/venv/bin/pip --no-cache-dir install --upgrade -c requirements/upper-constraints.txt /nova \
    && mkdir -p /etc/nova/ \
    && cp -r /nova/etc/nova/* /etc/nova/ \
    && chown -R nova: /etc/nova/ \
    && sed -i 's|^exec_dirs.*|exec_dirs=/var/lib/kolla/venv/bin,/sbin,/usr/sbin,/bin,/usr/bin,/usr/local/bin,/usr/local/sbin|g' /etc/nova/rootwrap.conf

COPY nova_sudoers /etc/sudoers.d/kolla_nova_sudoers
RUN chmod 750 /etc/sudoers.d \
    && chmod 440 /etc/sudoers.d/kolla_nova_sudoers



COPY extend_start.sh /usr/local/bin/kolla_extend_start

RUN touch /usr/local/bin/kolla_nova_extend_start \
    && chmod 755 /usr/local/bin/kolla_extend_start /usr/local/bin/kolla_nova_extend_start
