FROM intelonp/centos-source-openstack-base:2.3.201610190134
MAINTAINER Intel Corp. (http://www.intel.com)




RUN mkdir -p /bifrost-base-source && git clone git://git.openstack.org/openstack/bifrost /bifrost-base-source/bifrost-base && pushd /bifrost-base-source/bifrost-base && git checkout ba9d981e4dd1a76636a3643d26cbab9e6b87cf71 && popd

COPY build_arg.yml /tmp/build_arg.yml
RUN ln -s bifrost-base-source/* bifrost \
    && useradd --user-group bifrost \
    && /var/lib/kolla/venv/bin/pip --no-cache-dir install --upgrade -c requirements/upper-constraints.txt /bifrost

WORKDIR /bifrost




RUN bash -c './scripts/env-setup.sh && source ./env-vars && source /opt/stack/ansible/hacking/env-setup && \
    ansible-playbook -vvvv -i /bifrost/playbooks/inventory/localhost /bifrost/playbooks/install.yaml \
    -e @/tmp/build_arg.yml && \

    yum clean all'






COPY bifrost_sudoers /etc/sudoers.d/bifrost_sudoers

RUN usermod -a -G kolla bifrost \
    && chmod 750 /etc/sudoers.d \
    && chmod 440 /etc/sudoers.d/bifrost_sudoers \
    && chown -R bifrost:bifrost /bifrost
