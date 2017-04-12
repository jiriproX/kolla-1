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








RUN usermod --append --home /var/lib/monasca --groups kolla monasca \
    && mkdir -p /var/lib/monasca \
    && chown -R 42431:42431 /var/lib/monasca




RUN mkdir -p /etc/monasca \
    && chown -R monasca: /etc/monasca



COPY extend_start.sh /usr/local/bin/kolla_extend_start

RUN touch /usr/local/bin/kolla_monasca_extend_start \
    && chmod 755 /usr/local/bin/kolla_extend_start /usr/local/bin/kolla_monasca_extend_start

