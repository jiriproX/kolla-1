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

FROM intelonp/centos-source-openstack-base:0014
MAINTAINER Intel Corp. (http://www.intel.com)








RUN usermod --append --home /var/lib/solum --groups kolla solum \
    && mkdir -p /var/lib/solum \
    && chown -R 42444:42444 /var/lib/solum




RUN mkdir -p /solum-base-source && git clone http://tarballs.openstack.org/solum/solum-master.tar.gz /solum-base-source/solum-base && pushd /solum-base-source/solum-base && git checkout None && popd

RUN ln -s solum-base-source/* solum \
    && /var/lib/kolla/venv/bin/pip --no-cache-dir install --upgrade -c requirements/upper-constraints.txt /solum \
    && mkdir -p /etc/solum \
    && cp -r /solum/etc/solum/* /etc/solum/ \
    && chown -R solum: /etc/solum



COPY extend_start.sh /usr/local/bin/kolla_extend_start

RUN touch /usr/local/bin/kolla_solum_extend_start \
    && chmod 755 /usr/local/bin/kolla_extend_start /usr/local/bin/kolla_solum_extend_start
