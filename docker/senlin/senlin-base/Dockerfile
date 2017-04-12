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








RUN usermod --append --home /var/lib/senlin --groups kolla senlin \
    && mkdir -p /var/lib/senlin \
    && chown -R 42443:42443 /var/lib/senlin




RUN mkdir -p /senlin-base-source && git clone git://git.openstack.org/openstack/senlin /senlin-base-source/senlin-base && pushd /senlin-base-source/senlin-base && git checkout 3278a7fc8777a6153a11987a76b1ba498ecf20e3 && popd

RUN ln -s senlin-base-source/* senlin \
    && /var/lib/kolla/venv/bin/pip --no-cache-dir install --upgrade -c requirements/upper-constraints.txt /senlin \
    && mkdir -p /etc/senlin \
    && cp -r /senlin/etc/senlin/* /etc/senlin \
    && chown -R senlin: /etc/senlin



COPY extend_start.sh /usr/local/bin/kolla_extend_start

RUN touch /usr/local/bin/kolla_senlin_extend_start \
    && chmod 755 /usr/local/bin/kolla_extend_start /usr/local/bin/kolla_senlin_extend_start
