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

FROM intelonp/centos-source-freezer-base:0013
MAINTAINER Intel Corp. (http://www.intel.com)







    
        

RUN yum -y install mod_wsgi httpd && yum clean all

RUN sed -i -r 's,^(Listen 80),#\1,' /etc/httpd/conf/httpd.conf
    

RUN mkdir -p /freezer-api-source && git clone http://tarballs.openstack.org/freezer-api/freezer-api-master.tar.gz /freezer-api-source/freezer-api && pushd /freezer-api-source/freezer-api && git checkout None && popd

RUN ln -s freezer-api-source/* freezer-api \
    && /var/lib/kolla/venv/bin/pip --no-cache-dir install --upgrade -c requirements/upper-constraints.txt /freezer-api \
    && cp -r /freezer-api/etc/freezer/* /etc/freezer/



COPY extend_start.sh /usr/local/bin/kolla_freezer_extend_start
RUN chmod 755 /usr/local/bin/kolla_freezer_extend_start

