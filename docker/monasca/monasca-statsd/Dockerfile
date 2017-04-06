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

FROM intelonp/centos-source-monasca-base:test_1
MAINTAINER Intel Corp. (http://www.intel.com)







RUN mkdir -p /monasca-statsd-source && git clone http://tarballs.openstack.org/monasca-statsd/monasca-statsd-1.3.0.tar.gz /monasca-statsd-source/monasca-statsd && pushd /monasca-statsd-source/monasca-statsd && git checkout None && popd

# NOTE(SamYaple): <=1.3.0 do not have any packages in requirements.txt and that
# breaks pip. So removing constraints file.
RUN ln -s monasca-statsd-source/* monasca-statsd \
    && /var/lib/kolla/venv/bin/pip --no-cache-dir install --upgrade /monasca-statsd







USER monasca