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

FROM intelonp/centos-source-openstack-base:test-1
MAINTAINER Intel Corp. (http://www.intel.com)







# Since the gate cannot do DinD on centos due to the age of the kernel, we don't
# build a true DinD image. Should the time come that we get a newer kernel in
# the centos gate and we want to do multinode we can populate this container
RUN /bin/true



COPY start.sh /usr/local/bin/kolla_start
RUN chmod 755 /usr/local/bin/kolla_start


