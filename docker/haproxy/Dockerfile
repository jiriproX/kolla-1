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

FROM intelonp/centos-source-base:0017
MAINTAINER Intel Corp. (http://www.intel.com)








RUN usermod --append --home /var/lib/haproxy --groups kolla haproxy \
    && mkdir -p /var/lib/haproxy \
    && chown -R 42454:42454 /var/lib/haproxy





RUN yum -y install haproxy socat && yum clean all

RUN mkdir -p /var/lib/kolla/haproxy \
    && chown -R haproxy: /var/lib /run

COPY ensure_latest_config.sh /usr/local/bin/kolla_ensure_haproxy_latest_config
RUN chmod 755 /usr/local/bin/kolla_ensure_haproxy_latest_config


