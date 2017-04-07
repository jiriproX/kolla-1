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








RUN usermod --append --home /var/lib/sahara --groups kolla sahara \
    && mkdir -p /var/lib/sahara \
    && chown -R 42441:42441 /var/lib/sahara




RUN mkdir -p /sahara-base-source && git clone git://git.openstack.org/openstack/sahara /sahara-base-source/sahara-base && pushd /sahara-base-source/sahara-base && git checkout c465fa80b9b769e886ad0fb5750ed4fff17f0eaa && popd

RUN ln -s sahara-base-source/* sahara \
    && /var/lib/kolla/venv/bin/pip --no-cache-dir install --upgrade -c requirements/upper-constraints.txt /sahara \
    && mkdir -p /etc/sahara \
    && cp -r /sahara/etc/sahara/* /etc/sahara/ \
    && chown -R sahara: /etc/sahara \
    && sed -i 's|^exec_dirs.*|exec_dirs=/var/lib/kolla/venv/bin,/sbin,/usr/sbin,/bin,/usr/bin,/usr/local/bin,/usr/local/sbin|g' /etc/sahara/rootwrap.conf



COPY sahara_sudoers /etc/sudoers.d/kolla_sahara_sudoers
COPY extend_start.sh /usr/local/bin/kolla_extend_start

RUN chmod 750 /etc/sudoers.d \
    && chmod 640 /etc/sudoers.d/kolla_sahara_sudoers \
    && touch /usr/local/bin/kolla_sahara_extend_start \
    && chmod 755 /usr/local/bin/kolla_extend_start /usr/local/bin/kolla_sahara_extend_start
