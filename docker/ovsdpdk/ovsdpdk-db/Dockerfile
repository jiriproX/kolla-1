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

FROM intelonp/centos-source-ovsdpdk:test1
MAINTAINER Intel Corp. (http://www.intel.com)



COPY ovs_ensure_configured.sh /usr/local/bin/kolla_ensure_ovsdpdk_configured
COPY extend_start.sh /usr/local/bin/kolla_ovsdpdk_extend_start
COPY start_ovsdb_server.sh /usr/local/bin/start-ovsdb-server
RUN chmod 755 /usr/local/bin/kolla_ensure_ovsdpdk_configured \
              /usr/local/bin/kolla_ovsdpdk_extend_start \
              /usr/local/bin/start-ovsdb-server


