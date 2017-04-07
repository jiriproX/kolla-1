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

FROM intelonp/centos-source-monasca-base:001
MAINTAINER Intel Corp. (http://www.intel.com)







RUN mkdir -p /monasca-persister-source && git clone http://tarballs.openstack.org/monasca-persister/monasca-persister-1.1.0.tar.gz /monasca-persister-source/monasca-persister && pushd /monasca-persister-source/monasca-persister && git checkout None && popd

RUN ln -s monasca-persister-source/* monasca-persister \
    && /var/lib/kolla/venv/bin/pip --no-cache-dir install --upgrade -c requirements/upper-constraints.txt /monasca-persister







USER monasca