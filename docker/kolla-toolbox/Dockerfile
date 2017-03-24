FROM intelonp/centos-source-base:17.04.0-test
MAINTAINER Intel Corp. (http://www.intel.com)










RUN usermod --append --home /var/lib/ansible --groups kolla ansible \
    && mkdir -p /var/lib/ansible \
    && chown -R 42401:42401 /var/lib/ansible



    


RUN yum -y install crudini gcc gdisk git jq libffi-devel libxml2-devel libxslt-devel MariaDB-devel MariaDB-shared MariaDB-client openssl-devel python-devel openssh-clients && yum clean all


RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py \
    && python get-pip.py \
    && rm get-pip.py


RUN pip --no-cache-dir install \
    pytz \
    ansible==2.1.1.0 \
    MySQL-python \
    os-client-config==1.16.0 \
    pyudev \
    shade==1.5.0

RUN mkdir -p /etc/ansible /usr/share/ansible \
    && echo 'localhost ansible_connection=local' > /etc/ansible/hosts \
    && sed -i 's|  "identity_api_version": "2.0",|  "identity_api_version": "3",|' /usr/lib/python2.7/site-packages/os_client_config/defaults.json

COPY find_disks.py kolla_keystone_service.py kolla_keystone_user.py kolla_sanity.py /usr/share/ansible/
COPY ansible.cfg /var/lib/ansible/.ansible.cfg

COPY ansible_sudoers /etc/sudoers.d/kolla_ansible_sudoers
RUN chmod 440 /etc/sudoers.d/kolla_ansible_sudoers




USER ansible