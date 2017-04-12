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

FROM intelonp/centos-source-openstack-base:0017
MAINTAINER Intel Corp. (http://www.intel.com)








RUN usermod --append --home /var/lib/tacker --groups kolla tacker \
    && mkdir -p /var/lib/tacker \
    && chown -R 42446:42446 /var/lib/tacker




RUN mkdir -p /tacker-source && git clone http://tarballs.openstack.org/tacker/tacker-master.tar.gz /tacker-source/tacker && pushd /tacker-source/tacker && git checkout None && popd

RUN ln -s tacker-source/* tacker \
    && /var/lib/kolla/venv/bin/pip --no-cache-dir install --upgrade -c requirements/upper-constraints.txt /tacker \
    && mkdir -p /etc/tacker \
    && cp -r /tacker/etc/tacker/* /etc/tacker \
    && chown -R tacker: /etc/tacker



COPY extend_start.sh /usr/local/bin/kolla_extend_start

RUN chmod 755 /usr/local/bin/kolla_extend_start




USER tacker