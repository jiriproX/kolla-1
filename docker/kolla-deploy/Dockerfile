FROM intelonp/centos-source-base:2.3.201610190134
MAINTAINER Intel Corp. (http://www.intel.com)



RUN yum -y install \
        gcc \
        git \
        libffi-devel \
        libxml2-devel \
        libxslt-devel \
        MariaDB-devel \
        MariaDB-shared \
        openssl-devel \
        python-devel \
        openssh-clients \
        sshpass \
    && yum clean all
#    && yum clean all \
#    && rpm -e --nodeps pytz



# TODO(jeffrey4l): Pin the pip to the 7.1.2. version. latest pip
# (now 8.0) can not install the package when conflict with the
# system. The best solution should use the virtualenv for
# isolation or following bug is fixed:
# https://github.com/pypa/pip/pull/3389

RUN echo 'pip==7.1.2' > /root/cap-pip.txt
RUN curl -Ss https://bootstrap.pypa.io/get-pip.py -o get-pip.py \
    && python get-pip.py -c /root/cap-pip.txt \
    && rm get-pip.py \
    && pip --no-cache-dir install \
        MySQL-python \
        os-client-config==1.16.0 \
        pyudev \
        shade==1.4.0

RUN mkdir -p /root && git clone git://git.openstack.org/openstack/kolla /root/kolla && pushd /root/kolla && git checkout 03d86d5f242e3acda754524f864df717f8a3332a && popd


RUN cd /root/kolla \
    && pip --no-cache-dir install ansible==2.1.0.0 . \
    && mkdir -p /etc/kolla \
    && cp /root/kolla/etc/kolla/globals.yml /etc/kolla \
    && cp /root/kolla/etc/kolla/passwords.yml /etc/kolla \
    && cp /root/kolla/ansible/inventory/multinode /etc/kolla/inventory

ENV KOLLA_SERVICE_NAME=kolla-deploy TERM=xterm

CMD ["/bin/sleep", "infinity"]



# USER ansible