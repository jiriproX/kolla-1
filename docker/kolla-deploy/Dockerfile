FROM intelonp/centos-source-base:17.04.0
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
ADD kolla-deploy-archive /kolla-deploy-source
RUN ln -s /kolla-deploy-source/* /root/kolla \
    && pip --no-cache-dir install --upgrade /root/kolla \
    && mkdir -p /etc/kolla \
    && cp /root/kolla/etc/kolla/globals.yml /etc/kolla \
    && cp /root/kolla/etc/kolla/passwords.yml /etc/kolla

ENV KOLLA_SERVICE_NAME=kolla-deploy TERM=xterm

CMD ["/bin/sleep", "infinity"]


# USER ansible