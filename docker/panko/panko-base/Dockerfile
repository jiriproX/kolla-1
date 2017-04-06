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

FROM intelonp/centos-source-openstack-base:test_2
MAINTAINER Intel Corp. (http://www.intel.com)








RUN usermod --append --home /var/lib/panko --groups kolla panko \
    && mkdir -p /var/lib/panko \
    && chown -R 42438:42438 /var/lib/panko



    

       
RUN yum -y install httpd mod_wsgi python-ldappool && yum clean all
RUN sed -i -r 's,^(Listen 80),#\1,' /etc/httpd/conf/httpd.conf

    
RUN mkdir -p /panko-base-source && git clone http://tarballs.openstack.org/panko/panko-master.tar.gz /panko-base-source/panko-base && pushd /panko-base-source/panko-base && git checkout None && popd


RUN ln -s panko-base-source/* panko \
    && /var/lib/kolla/venv/bin/pip --no-cache-dir install --upgrade -c requirements/upper-constraints.txt /panko \
    && mkdir -p /etc/panko \
    && cp -r /panko/etc/panko/* /etc/panko/ \
    && chown -R panko: /etc/panko



COPY extend_start.sh /usr/local/bin/kolla_extend_start

RUN touch /usr/local/bin/kolla_panko_extend_start \
    && chmod 755 /usr/local/bin/kolla_extend_start /usr/local/bin/kolla_panko_extend_start
