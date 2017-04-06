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

FROM intelonp/centos-source-base:test_1
MAINTAINER Intel Corp. (http://www.intel.com)








RUN usermod --append --home /var/lib/td-agent --groups kolla td-agent \
    && mkdir -p /var/lib/td-agent \
    && chown -R 42447:42447 /var/lib/td-agent




    



RUN yum -y install td-agent gcc-c++ make && yum clean all

RUN ulimit -n 65536 \
    && sed -i -e "s/USER=td-agent/USER=root/" -e "s/GROUP=td-agent/GROUP=root/" /etc/init.d/td-agent \
    && td-agent-gem install fluent-plugin-parser fluent-plugin-kubernetes_metadata_filter fluent-plugin-elasticsearch fluent-plugin-grep fluent-plugin-grok-parser fluent-plugin-rewrite-tag-filter \
    && rm -f /etc/td-agent/td-agent.conf

COPY fluentd_sudoers /etc/sudoers.d/kolla_fluentd_sudoers
COPY extend_start.sh /usr/local/bin/kolla_extend_start

RUN chmod 440 /etc/sudoers.d/kolla_fluentd_sudoers \
    && chmod 755 /usr/local/bin/kolla_extend_start \
    && chown -R td-agent: /etc/td-agent




USER td-agent