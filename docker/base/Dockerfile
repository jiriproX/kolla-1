FROM centos:latest
MAINTAINER Intel Corp. (http://www.intel.com)

LABEL kolla_version="3.0.0"





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



RUN if [ $(awk '{match($0, /[0-9]+/,version)}END{print version[0]}' /etc/system-release) != "7" ]; then \
        echo "Only supported 7 release on centos"; false; \
    fi \
    && cat /tmp/kolla_bashrc >> /etc/bashrc

#### BEGIN REPO ENABLEMENT
# Turns on Elasticsearch repos


COPY elasticsearch.repo /etc/yum.repos.d/elasticsearch.repo

COPY kibana.yum.repo /etc/yum.repos.d/kibana.yum.repo

COPY MariaDB.repo /etc/yum.repos.d/MariaDB.repo

COPY influxdb.repo /etc/yum.repos.d/influxdb.repo

COPY grafana.repo /etc/yum.repos.d/grafana.repo



RUN yum -y install http://repo.percona.com/release/7/RPMS/x86_64/percona-release-0.1-3.noarch.rpm && yum clean all


RUN true && rpm --import http://yum.mariadb.org/RPM-GPG-KEY-MariaDB && rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-Percona  && rpm --import https://packages.elastic.co/GPG-KEY-elasticsearch && rpm --import https://repos.influxdata.com/influxdb.key && rpm --import https://packagecloud.io/gpg.key && rpm --import https://grafanarel.s3.amazonaws.com/RPM-GPG-KEY-grafana 
    



    
    

    

    

RUN rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7





RUN yum -y install epel-release  yum-plugin-priorities centos-release-ceph-jewel centos-release-openstack-newton centos-release-qemu-ev && yum clean all
RUN true \
 && rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-SIG-Cloud && rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-SIG-Storage && rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-SIG-Virtualization && yum clean all

    
    

    
    

    
    

    
    

#### END REPO ENABLEMENT



    
    

    


# Update packages
RUN yum -y install curl sudo tar which lvm2 scsi-target-utils iproute iscsi-initiator-utils && yum clean all

    
    



COPY set_configs.py /usr/local/bin/kolla_set_configs
COPY start.sh /usr/local/bin/kolla_start
COPY sudoers /etc/sudoers
COPY curlrc /root/.curlrc
RUN touch /usr/local/bin/kolla_extend_start \
    && chmod 755 /usr/local/bin/kolla_start /usr/local/bin/kolla_extend_start /usr/local/bin/kolla_set_configs \
    && chmod 440 /etc/sudoers \
    && groupadd kolla \
    && mkdir -p /var/log/kolla \
    && chown :kolla /var/log/kolla \
    && chmod 2775 /var/log/kolla \
    && rm -f /tmp/kolla_bashrc \
    && curl -sSL https://github.com/Yelp/dumb-init/releases/download/v1.1.3/dumb-init_1.1.3_amd64 -o /usr/local/bin/dumb-init \
    && chmod +x /usr/local/bin/dumb-init


CMD ["kolla_start"]