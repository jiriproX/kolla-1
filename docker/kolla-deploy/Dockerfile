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

FROM intelonp/centos-source-base:0014
MAINTAINER Intel Corp. (http://www.intel.com)






    



RUN yum -y install gcc git libffi-devel libxml2-devel libxslt-devel MariaDB-devel MariaDB-shared openssl-devel python-devel openssh-clients sshpass python-netaddr && yum clean all


RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py \
    && python get-pip.py \
    && rm get-pip.py


RUN pip --no-cache-dir install \
    ansible==2.2.0.0 \
    MySQL-python \
    os-client-config \
    pyudev \
    shade

# install kolla deploy source
# create and copy in files as placeholders
RUN mkdir -p /kolla-deploy-source && git clone git://github.com/intel-onp/kolla-ansible /kolla-deploy-source/kolla-deploy && pushd /kolla-deploy-source/kolla-deploy && git checkout 380fb1b93a146abec30d3e06f5904a08094020db && popd

RUN ln -s /kolla-deploy-source/* /root/kolla \
    && pip --no-cache-dir install --upgrade /root/kolla \
    && mkdir -p /etc/kolla \
    && cp /root/kolla/etc/kolla/globals.yml /etc/kolla \
    && cp /root/kolla/etc/kolla/passwords.yml /etc/kolla

ENV KOLLA_SERVICE_NAME=kolla-deploy TERM=xterm

CMD ["/bin/sleep", "infinity"]


# USER ansible