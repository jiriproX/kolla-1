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





RUN mkdir -p /zun-base-source && git clone http://tarballs.openstack.org/zun/zun-master.tar.gz /zun-base-source/zun-base && pushd /zun-base-source/zun-base && git checkout None && popd

RUN ln -s zun-base-source/* zun \
    && useradd --user-group --create-home --home-dir /var/lib/zun zun \
    && /var/lib/kolla/venv/bin/pip --no-cache-dir install --upgrade -c requirements/upper-constraints.txt /zun \
    && mkdir -p /etc/zun \
    && cp -r /zun/etc/* /etc/zun/ \
    && chown -R zun: /etc/zun



COPY extend_start.sh /usr/local/bin/kolla_extend_start

RUN usermod -a -G kolla zun \
    && touch /usr/local/bin/kolla_zun_extend_start \
    && chmod 755 /usr/local/bin/kolla_extend_start /usr/local/bin/kolla_zun_extend_start
