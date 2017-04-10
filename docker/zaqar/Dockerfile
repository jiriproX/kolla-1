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

FROM intelonp/centos-source-openstack-base:0012
MAINTAINER Intel Corp. (http://www.intel.com)








RUN usermod --append --home /var/lib/zaqar --groups kolla zaqar \
    && mkdir -p /var/lib/zaqar \
    && chown -R 42452:42452 /var/lib/zaqar



RUN mkdir -p /zaqar-source && git clone git://git.openstack.org/openstack/zaqar /zaqar-source/zaqar && pushd /zaqar-source/zaqar && git checkout f196f9a8a92bb7206ef64e8bba151ba659c3aab6 && popd

RUN ln -s zaqar-source/* zaqar \
    && /var/lib/kolla/venv/bin/pip --no-cache-dir install --upgrade -c requirements/upper-constraints.txt pymongo /zaqar \
    && mkdir -p /etc/zaqar \
    && cp -r /zaqar/etc/* /etc/zaqar/ \
    && mv /etc/zaqar/policy.json.sample /etc/zaqar/policy.json \
    && chown -R zaqar: /etc/zaqar



COPY extend_start.sh /usr/local/bin/kolla_extend_start
RUN chmod 755 /usr/local/bin/kolla_extend_start




USER zaqar