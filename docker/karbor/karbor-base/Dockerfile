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

FROM intelonp/centos-source-openstack-base:test1
MAINTAINER Intel Corp. (http://www.intel.com)








RUN usermod --append --home /var/lib/karbor --groups kolla karbor \
    && mkdir -p /var/lib/karbor \
    && chown -R 42458:42458 /var/lib/karbor




RUN mkdir -p /karbor-base-source && git clone http://tarballs.openstack.org/karbor/karbor-master.tar.gz /karbor-base-source/karbor-base && pushd /karbor-base-source/karbor-base && git checkout None && popd

RUN ln -s karbor-base-source/* karbor \
    && /var/lib/kolla/venv/bin/pip --no-cache-dir install --upgrade -c requirements/upper-constraints.txt /karbor \
    && mkdir -p /etc/karbor \
    && cp -r /karbor/etc/* /etc/karbor/ \
    && chown -R karbor: /etc/karbor



COPY extend_start.sh /usr/local/bin/kolla_extend_start

RUN touch /usr/local/bin/kolla_karbor_extend_start \
    && chmod 755 /usr/local/bin/kolla_extend_start /usr/local/bin/kolla_karbor_extend_start
