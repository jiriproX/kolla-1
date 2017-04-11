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

FROM intelonp/centos-source-openstack-base:0013
MAINTAINER Intel Corp. (http://www.intel.com)








RUN usermod --append --home /var/lib/cloudkitty --groups kolla cloudkitty \
    && mkdir -p /var/lib/cloudkitty \
    && chown -R 42408:42408 /var/lib/cloudkitty




RUN mkdir -p /cloudkitty-base-source && git clone git://git.openstack.org/openstack/cloudkitty /cloudkitty-base-source/cloudkitty-base && pushd /cloudkitty-base-source/cloudkitty-base && git checkout 31845a888f7adf992667e5753ca45149ba5f13eb && popd

RUN ln -s cloudkitty-base-source/* cloudkitty \
    && /var/lib/kolla/venv/bin/pip --no-cache-dir install --upgrade -c requirements/upper-constraints.txt /cloudkitty \
    && mkdir -p /etc/cloudkitty  \
    && cp -r /cloudkitty/etc/cloudkitty/* /etc/cloudkitty/ \
    && chown -R cloudkitty: /etc/cloudkitty



COPY extend_start.sh /usr/local/bin/kolla_extend_start

RUN touch /usr/local/bin/kolla_cloudkitty_extend_start \
    && chmod 755 /usr/local/bin/kolla_extend_start /usr/local/bin/kolla_cloudkitty_extend_start
