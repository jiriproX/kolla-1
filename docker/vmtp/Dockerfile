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








RUN usermod --append --home /var/lib/vmtp --groups kolla vmtp \
    && mkdir -p /var/lib/vmtp \
    && chown -R 42450:42450 /var/lib/vmtp




RUN pip install vmtp



COPY vmtp_sudoers /etc/sudoers.d/kolla_vmtp_sudoers
RUN chmod 750 /etc/sudoers.d \
    && chmod 440 /etc/sudoers.d/kolla_vmtp_sudoers




USER vmtp