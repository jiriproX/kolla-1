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

FROM intelonp/centos-source-neutron-base:0017
MAINTAINER Intel Corp. (http://www.intel.com)







   
       
   

RUN yum -y install openswan && yum clean all

RUN mkdir -p /neutron-vpnaas-agent-source && git clone git://git.openstack.org/openstack/neutron-vpnaas /neutron-vpnaas-agent-source/neutron-vpnaas-agent && pushd /neutron-vpnaas-agent-source/neutron-vpnaas-agent && git checkout 6011ca5c2de41c0e6559cf1a091d774d296c8b9a && popd

RUN ln -s neutron-vpnaas-agent-source/* neutron_vpnaas \
    && /var/lib/kolla/venv/bin/pip --no-cache-dir install --upgrade -c requirements/upper-constraints.txt /neutron_vpnaas \
    && cp /neutron_vpnaas/etc/neutron/rootwrap.d/* /etc/neutron/rootwrap.d



COPY extend_start.sh /usr/local/bin/kolla_neutron_extend_start
RUN chmod 755 /usr/local/bin/kolla_neutron_extend_start




# TODO(pbourke): The libreswan driver required by redhat derived bases
# currently requires root in Neutron. Remove this if condition once
# https://bugs.launchpad.net/neutron/+bug/1644517 is addressed.