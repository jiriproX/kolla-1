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

FROM intelonp/centos-source-kuryr-base:0012
MAINTAINER Intel Corp. (http://www.intel.com)





RUN mkdir -p /kuryr-libnetwork-source && git clone git://git.openstack.org/openstack/kuryr-libnetwork /kuryr-libnetwork-source/kuryr-libnetwork && pushd /kuryr-libnetwork-source/kuryr-libnetwork && git checkout 9e99cc02428836a688926a44a6faf1b3414ffde3 && popd

RUN ln -s kuryr-libnetwork-source/* kuryr-libnetwork \
    && /var/lib/kolla/venv/bin/pip --no-cache-dir install --upgrade -c requirements/upper-constraints.txt /kuryr-libnetwork



