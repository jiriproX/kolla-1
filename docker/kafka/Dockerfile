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







RUN usermod --append --home /kafka --groups kolla kafka \
    && mkdir -p /kafka \
    && chown -R 42423:42423 /kafka




RUN echo 'source not yet available for centos' \
    && /bin/false






RUN curl -o kafka.tgz http://apache.osuosl.org/kafka/0.10.1.0/kafka_2.11-0.10.1.0.tgz \
    && tar xfvz kafka.tgz \
    && rm kafka.tgz \
    && ln -s kafka* kafka


COPY extend_start.sh /usr/local/bin/kolla_extend_start
RUN chmod 755 /usr/local/bin/kolla_extend_start \
    && chown -R kafka: /kafka




USER kafka