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

FROM intelonp/centos-source-base:001
MAINTAINER Intel Corp. (http://www.intel.com)








RUN usermod --append --home /var/lib/influxdb --groups kolla influxdb \
    && mkdir -p /var/lib/influxdb \
    && chown -R 42421:42421 /var/lib/influxdb



RUN yum -y install influxdb && yum clean all

COPY influxdb_sudoers /etc/sudoers.d/kolla_influxdb_sudoers
COPY extend_start.sh /usr/local/bin/kolla_extend_start

RUN chmod 750 /etc/sudoers.d \
    && chmod 440 /etc/sudoers.d/kolla_influxdb_sudoers \
    && chmod 755 /usr/local/bin/kolla_extend_start




USER influxdb