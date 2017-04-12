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

FROM intelonp/centos-source-openstack-base:0018
MAINTAINER Intel Corp. (http://www.intel.com)








RUN usermod --append --home /var/lib/freezer --groups kolla freezer \
    && mkdir -p /var/lib/freezer \
    && chown -R 42414:42414 /var/lib/freezer




RUN mkdir -p /freezer-base-source && git clone http://tarballs.openstack.org/freezer/freezer-master.tar.gz /freezer-base-source/freezer-base && pushd /freezer-base-source/freezer-base && git checkout None && popd

RUN ln -s freezer-base-source/* freezer \
    && mkdir -p /etc/freezer \
    && chown -R freezer: /etc/freezer \
    && /var/lib/kolla/venv/bin/pip --no-cache-dir install --upgrade -c requirements/upper-constraints.txt /freezer \
    && cp -r /freezer/etc/* /etc/freezer



COPY freezer_sudoers /etc/sudoers.d/kolla_freezer_sudoers
COPY extend_start.sh /usr/local/bin/kolla_extend_start

RUN chmod 750 /etc/sudoers.d \
    && chmod 640 /etc/sudoers.d/kolla_freezer_sudoers \
    && touch /usr/local/bin/kolla_freezer_extend_start \
    && chmod 755 /usr/local/bin/kolla_extend_start /usr/local/bin/kolla_freezer_extend_start
