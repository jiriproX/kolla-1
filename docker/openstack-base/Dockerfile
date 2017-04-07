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

FROM intelonp/centos-source-base:test1
MAINTAINER Intel Corp. (http://www.intel.com)






    

RUN yum -y install git iproute openssl && yum clean all



    
        
    

RUN yum -y install gcc gcc-c++ libffi-devel libxml2-devel libxslt-devel libyaml-devel MariaDB-devel openldap-devel openssl-devel postgresql postgresql-devel python-devel sqlite-devel zip redhat-rpm-config redhat-lsb-core pciutils autoconf libtool fuse-devel gcc make autoconf automake libpcap-devel python-devel python-six && yum clean all


RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py \
    && python get-pip.py \
    && rm get-pip.py




RUN mkdir -p /openstack-base-source && git clone https://git.openstack.org/openstack/requirements.git /openstack-base-source/openstack-base && pushd /openstack-base-source/openstack-base && git checkout 766b556b55548704892a9c0dd09b0417ad49b2c2 && popd

RUN ln -s openstack-base-source/* /requirements \
    && mkdir -p /var/lib/kolla \
    && pip --no-cache-dir install -U virtualenv \
    && virtualenv --system-site-packages /var/lib/kolla/venv

RUN /var/lib/kolla/venv/bin/pip --no-cache-dir install --upgrade -c requirements/upper-constraints.txt Babel Mako MarkupSafe Paste PasteDeploy PyYAML Routes SQLAlchemy Tempita WebOb alembic amqp anyjson aodhclient appdirs cachetools cliff cmd2 contextlib2 debtcollector decorator enum34 eventlet fasteners funcsigs functools32 futures futurist gnocchiclient greenlet iso8601 jinja2 jsonpatch jsonpointer jsonschema keystoneauth1 keystonemiddleware kombu monotonic msgpack-python MySQL-python netaddr netifaces os-client-config oslo.concurrency oslo.config oslo.context oslo.db oslo.i18n oslo.log oslo.messaging oslo.middleware oslo.policy oslo.serialization oslo.service oslo.utils oslo.vmware pbr pika pika-pool positional prettytable pycadf pycrypto pyinotify pymysql pyparsing python-barbicanclient python-ceilometerclient python-cinderclient python-cloudkittyclient python-congressclient python-dateutil python-designateclient python-editor python-glanceclient python-heatclient python-ironicclient python-keystoneclient python-magnumclient python-manilaclient python-memcached python-mistralclient python-muranoclient python-neutronclient python-novaclient python-openstackclient python-saharaclient python-swiftclient python-troveclient python-zaqarclient pytz repoze.lru requests requestsexceptions retrying simplejson six sqlalchemy-migrate sqlparse stevedore unicodecsv warlock wrapt 

ENV PATH /var/lib/kolla/venv/bin:$PATH




RUN mkdir -p /plugins && git clone https://github.com/openvswitch/ovs /plugins/openstack-base-plugin-ovs-archive-ph && pushd /plugins/openstack-base-plugin-ovs-archive-ph && git checkout f4b0e64cffb4777ff03d48621c3eadcf1d8c19f3 && popd 

RUN ln -s /plugins/openstack-base-plugin-ovs-archive-*/ /ovs

RUN cd /ovs && \
    ./boot.sh && \
    bash -c 'CFLAGS="$(rpm --eval '%optflags') -O3 -fPIC" LDFLAGS="" ./configure  --prefix=/usr --with-dbdir=/etc/openvswitch --with-rundir=/run/openvswitch' && \
    make -j $(nproc) && \
    make install

RUN rm -rf /plugins