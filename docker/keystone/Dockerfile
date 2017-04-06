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

FROM intelonp/centos-source-openstack-base:test_1
MAINTAINER Intel Corp. (http://www.intel.com)


    

RUN yum -y install \
        httpd \
        mod_wsgi \
    && yum clean all \
    && sed -i -r 's,^(Listen 80),#\1,' /etc/httpd/conf/httpd.conf

    

RUN mkdir -p /keystone-source && git clone None /keystone-source/keystone && pushd /keystone-source/keystone && git checkout None && popd

RUN ln -s keystone-source/* keystone \
    && useradd --user-group keystone \
    && /var/lib/kolla/venv/bin/pip --no-cache-dir install --upgrade -c requirements/upper-constraints.txt /keystone \
    && mkdir -p /etc/keystone /var/www/cgi-bin/keystone /var/log/apache2 /home/keystone \
    && cp -r /keystone/etc/* /etc/keystone/ \
    && cp /keystone/httpd/keystone.py /var/www/cgi-bin/keystone/admin \
    && cp /keystone/httpd/keystone.py /var/www/cgi-bin/keystone/main \
    && chown -R keystone: /etc/keystone /var/www/cgi-bin/keystone /var/log/apache2 /home/keystone



# NOTE(SamYaple): This is to reintroduce a deprecated option as a quick-fix
# until the correct new procedure is implemented.
# TODO(SamYaple): Replace this with `keystone-manage bootstrap`
RUN sed -i 's|token_auth json_body|token_auth admin_token_auth json_body|g' /etc/keystone/keystone-paste.ini

RUN usermod -a -G kolla keystone \
    && chown -R keystone: /var/www/cgi-bin/keystone \
    && chmod 755 /var/www/cgi-bin/keystone/*

COPY extend_start.sh /usr/local/bin/kolla_extend_start
RUN chmod 755 /usr/local/bin/kolla_extend_start
