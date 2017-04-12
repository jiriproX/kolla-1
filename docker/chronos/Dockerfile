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

FROM intelonp/centos-source-mesos-base:0015
MAINTAINER Intel Corp. (http://www.intel.com)



RUN yum install -y \
        chronos \
    && yum clean all



RUN useradd --user-group chronos

CMD chronos run_jar --http_port $CHRONOS_HTTP_PORT --master $CHRONOS_MASTER --zk_hosts $CHRONOS_ZK_HOSTS



USER chronos