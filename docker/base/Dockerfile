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

FROM centos:7
MAINTAINER Intel Corp. (http://www.intel.com)



RUN groupadd --force --gid 42401 ansible \
    && useradd -M --shell /usr/sbin/nologin --uid 42401 --gid 42401 ansible \
    && groupadd --force --gid 42402 aodh \
    && useradd -M --shell /usr/sbin/nologin --uid 42402 --gid 42402 aodh \
    && groupadd --force --gid 42403 barbican \
    && useradd -M --shell /usr/sbin/nologin --uid 42403 --gid 42403 barbican \
    && groupadd --force --gid 42404 bifrost \
    && useradd -M --shell /usr/sbin/nologin --uid 42404 --gid 42404 bifrost \
    && groupadd --force --gid 42405 ceilometer \
    && useradd -M --shell /usr/sbin/nologin --uid 42405 --gid 42405 ceilometer \
    && groupadd --force --gid 64045 ceph \
    && useradd -M --shell /usr/sbin/nologin --uid 64045 --gid 64045 ceph \
    && groupadd --force --gid 42406 chrony \
    && useradd -M --shell /usr/sbin/nologin --uid 42406 --gid 42406 chrony \
    && groupadd --force --gid 42407 cinder \
    && useradd -M --shell /usr/sbin/nologin --uid 42407 --gid 42407 cinder \
    && groupadd --force --gid 42408 cloudkitty \
    && useradd -M --shell /usr/sbin/nologin --uid 42408 --gid 42408 cloudkitty \
    && groupadd --force --gid 42409 collectd \
    && useradd -M --shell /usr/sbin/nologin --uid 42409 --gid 42409 collectd \
    && groupadd --force --gid 42410 congress \
    && useradd -M --shell /usr/sbin/nologin --uid 42410 --gid 42410 congress \
    && groupadd --force --gid 42411 designate \
    && useradd -M --shell /usr/sbin/nologin --uid 42411 --gid 42411 designate \
    && groupadd --force --gid 42412 elasticsearch \
    && useradd -M --shell /usr/sbin/nologin --uid 42412 --gid 42412 elasticsearch \
    && groupadd --force --gid 42413 etcd \
    && useradd -M --shell /usr/sbin/nologin --uid 42413 --gid 42413 etcd \
    && groupadd --force --gid 42414 freezer \
    && useradd -M --shell /usr/sbin/nologin --uid 42414 --gid 42414 freezer \
    && groupadd --force --gid 42415 glance \
    && useradd -M --shell /usr/sbin/nologin --uid 42415 --gid 42415 glance \
    && groupadd --force --gid 42416 gnocchi \
    && useradd -M --shell /usr/sbin/nologin --uid 42416 --gid 42416 gnocchi \
    && groupadd --force --gid 42417 grafana \
    && useradd -M --shell /usr/sbin/nologin --uid 42417 --gid 42417 grafana \
    && groupadd --force --gid 42454 haproxy \
    && useradd -M --shell /usr/sbin/nologin --uid 42454 --gid 42454 haproxy \
    && groupadd --force --gid 42418 heat \
    && useradd -M --shell /usr/sbin/nologin --uid 42418 --gid 42418 heat \
    && groupadd --force --gid 42419 heka \
    && useradd -M --shell /usr/sbin/nologin --uid 42419 --gid 42419 heka \
    && groupadd --force --gid 42420 horizon \
    && useradd -M --shell /usr/sbin/nologin --uid 42420 --gid 42420 horizon \
    && groupadd --force --gid 42421 influxdb \
    && useradd -M --shell /usr/sbin/nologin --uid 42421 --gid 42421 influxdb \
    && groupadd --force --gid 42422 ironic \
    && useradd -M --shell /usr/sbin/nologin --uid 42422 --gid 42422 ironic \
    && groupadd --force --gid 42423 kafka \
    && useradd -M --shell /usr/sbin/nologin --uid 42423 --gid 42423 kafka \
    && groupadd --force --gid 42458 karbor \
    && useradd -M --shell /usr/sbin/nologin --uid 42458 --gid 42458 karbor \
    && groupadd --force --gid 42425 keystone \
    && useradd -M --shell /usr/sbin/nologin --uid 42425 --gid 42425 keystone \
    && groupadd --force --gid 42426 kibana \
    && useradd -M --shell /usr/sbin/nologin --uid 42426 --gid 42426 kibana \
    && groupadd --force --gid 42400 kolla \
    && useradd -M --shell /usr/sbin/nologin --uid 42400 --gid 42400 kolla \
    && groupadd --force --gid 42428 magnum \
    && useradd -M --shell /usr/sbin/nologin --uid 42428 --gid 42428 magnum \
    && groupadd --force --gid 42429 manila \
    && useradd -M --shell /usr/sbin/nologin --uid 42429 --gid 42429 manila \
    && groupadd --force --gid 42457 memcached \
    && useradd -M --shell /usr/sbin/nologin --uid 42457 --gid 42457 memcached \
    && groupadd --force --gid 42430 mistral \
    && useradd -M --shell /usr/sbin/nologin --uid 42430 --gid 42430 mistral \
    && groupadd --force --gid 42431 monasca \
    && useradd -M --shell /usr/sbin/nologin --uid 42431 --gid 42431 monasca \
    && groupadd --force --gid 65534 mongodb \
    && useradd -M --shell /usr/sbin/nologin --uid 42432 --gid 65534 mongodb \
    && groupadd --force --gid 42433 murano \
    && useradd -M --shell /usr/sbin/nologin --uid 42433 --gid 42433 murano \
    && groupadd --force --gid 42434 mysql \
    && useradd -M --shell /usr/sbin/nologin --uid 42434 --gid 42434 mysql \
    && groupadd --force --gid 42435 neutron \
    && useradd -M --shell /usr/sbin/nologin --uid 42435 --gid 42435 neutron \
    && groupadd --force --gid 42436 nova \
    && useradd -M --shell /usr/sbin/nologin --uid 42436 --gid 42436 nova \
    && groupadd --force --gid 42437 octavia \
    && useradd -M --shell /usr/sbin/nologin --uid 42437 --gid 42437 octavia \
    && groupadd --force --gid 42438 panko \
    && useradd -M --shell /usr/sbin/nologin --uid 42438 --gid 42438 panko \
    && groupadd --force --gid 42427 qemu \
    && useradd -M --shell /usr/sbin/nologin --uid 42427 --gid 42427 qemu \
    && groupadd --force --gid 42439 rabbitmq \
    && useradd -M --shell /usr/sbin/nologin --uid 42439 --gid 42439 rabbitmq \
    && groupadd --force --gid 42440 rally \
    && useradd -M --shell /usr/sbin/nologin --uid 42440 --gid 42440 rally \
    && groupadd --force --gid 42460 redis \
    && useradd -M --shell /usr/sbin/nologin --uid 42460 --gid 42460 redis \
    && groupadd --force --gid 42441 sahara \
    && useradd -M --shell /usr/sbin/nologin --uid 42441 --gid 42441 sahara \
    && groupadd --force --gid 42442 searchlight \
    && useradd -M --shell /usr/sbin/nologin --uid 42442 --gid 42442 searchlight \
    && groupadd --force --gid 42443 senlin \
    && useradd -M --shell /usr/sbin/nologin --uid 42443 --gid 42443 senlin \
    && groupadd --force --gid 42444 solum \
    && useradd -M --shell /usr/sbin/nologin --uid 42444 --gid 42444 solum \
    && groupadd --force --gid 42445 swift \
    && useradd -M --shell /usr/sbin/nologin --uid 42445 --gid 42445 swift \
    && groupadd --force --gid 42446 tacker \
    && useradd -M --shell /usr/sbin/nologin --uid 42446 --gid 42446 tacker \
    && groupadd --force --gid 42447 td-agent \
    && useradd -M --shell /usr/sbin/nologin --uid 42447 --gid 42447 td-agent \
    && groupadd --force --gid 42448 telegraf \
    && useradd -M --shell /usr/sbin/nologin --uid 42448 --gid 42448 telegraf \
    && groupadd --force --gid 42449 trove \
    && useradd -M --shell /usr/sbin/nologin --uid 42449 --gid 42449 trove \
    && groupadd --force --gid 42459 vitrage \
    && useradd -M --shell /usr/sbin/nologin --uid 42459 --gid 42459 vitrage \
    && groupadd --force --gid 42450 vmtp \
    && useradd -M --shell /usr/sbin/nologin --uid 42450 --gid 42450 vmtp \
    && groupadd --force --gid 42451 watcher \
    && useradd -M --shell /usr/sbin/nologin --uid 42451 --gid 42451 watcher \
    && groupadd --force --gid 42452 zaqar \
    && useradd -M --shell /usr/sbin/nologin --uid 42452 --gid 42452 zaqar \
    && groupadd --force --gid 42453 zookeeper \
    && useradd -M --shell /usr/sbin/nologin --uid 42453 --gid 42453 zookeeper

LABEL kolla_version="4.0.1"




ENV KOLLA_BASE_DISTRO centos
ENV KOLLA_INSTALL_TYPE source
ENV KOLLA_INSTALL_METATYPE mixed

#### Customize PS1 to be used with bash shell
COPY kolla_bashrc /tmp/
RUN cat /tmp/kolla_bashrc >> /etc/skel/.bashrc \
    && cat /tmp/kolla_bashrc >> /root/.bashrc

# PS1 var when used /bin/sh shell
ENV PS1="$(tput bold)($(printenv KOLLA_SERVICE_NAME))$(tput sgr0)[$(id -un)@$(hostname -s) $(pwd)]$ "


# For RPM Variants, enable the correct repositories - this should all be done
# in the base image so repos are consistent throughout the system.  This also
# enables to provide repo overrides at a later date in a simple fashion if we
# desire such functionality.  I think we will :)

RUN CURRENT_DISTRO_RELEASE=$(awk '{match($0, /[0-9]+/,version)}END{print version[0]}' /etc/system-release); \
    if [  $CURRENT_DISTRO_RELEASE != "7" ]; then \
        echo "Only supported 7 release on centos"; false; \
    fi \
    && cat /tmp/kolla_bashrc >> /etc/bashrc \
    && sed -i 's|^\(override_install_langs=.*\)|# \1|' /etc/yum.conf

#### BEGIN REPO ENABLEMENT

COPY elasticsearch.repo /etc/yum.repos.d/elasticsearch.repo
COPY grafana.repo /etc/yum.repos.d/grafana.repo
COPY influxdb.repo /etc/yum.repos.d/influxdb.repo
COPY kibana.yum.repo /etc/yum.repos.d/kibana.yum.repo
COPY MariaDB.repo /etc/yum.repos.d/MariaDB.repo
COPY td.repo /etc/yum.repos.d/td.repo
COPY zookeeper.repo /etc/yum.repos.d/zookeeper.repo


RUN yum -y install http://repo.percona.com/release/7/RPMS/x86_64/percona-release-0.1-4.noarch.rpm && yum clean all
RUN rpm --import http://yum.mariadb.org/RPM-GPG-KEY-MariaDB \
    && rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-Percona  \
    && rpm --import https://packages.elastic.co/GPG-KEY-elasticsearch \
    && rpm --import https://repos.influxdata.com/influxdb.key \
    && rpm --import https://packagecloud.io/gpg.key \
    && rpm --import https://grafanarel.s3.amazonaws.com/RPM-GPG-KEY-grafana \
    && rpm --import https://packages.treasuredata.com/GPG-KEY-td-agent



RUN curl -L http://buildlogs.centos.org/centos/7/cloud/x86_64/rdo-trunk-master-tested/delorean.repo -o /etc/yum.repos.d/delorean.repo

RUN curl -L http://trunk.rdoproject.org/centos7/delorean-deps.repo -o /etc/yum.repos.d/delorean-deps.repo


    
    

    

    

RUN rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7





RUN yum -y install epel-release  yum-plugin-priorities centos-release-ceph-jewel centos-release-qemu-ev && yum clean all
RUN rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-SIG-Storage \
    && rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-SIG-Virtualization \
    && yum clean all

    
    

    
    

    
    

#### END REPO ENABLEMENT



    
    

    


# Update packages
RUN yum -y install curl git sudo tar which lvm2 scsi-target-utils iproute iscsi-initiator-utils && yum clean all

    
    



COPY set_configs.py /usr/local/bin/kolla_set_configs
COPY start.sh /usr/local/bin/kolla_start
COPY sudoers /etc/sudoers
COPY curlrc /root/.curlrc


RUN curl -sSL https://github.com/Yelp/dumb-init/releases/download/v1.1.3/dumb-init_1.1.3_amd64 -o /usr/local/bin/dumb-init \
    && chmod +x /usr/local/bin/dumb-init


RUN touch /usr/local/bin/kolla_extend_start \
    && chmod 755 /usr/local/bin/kolla_start /usr/local/bin/kolla_extend_start /usr/local/bin/kolla_set_configs \
    && chmod 440 /etc/sudoers \
    && mkdir -p /var/log/kolla \
    && chown :kolla /var/log/kolla \
    && chmod 2775 /var/log/kolla \
    && rm -f /tmp/kolla_bashrc


CMD ["kolla_start"]