FROM intelonp/centos-source-base:2.3.201610190134
MAINTAINER Intel Corp. (http://www.intel.com)






    
RUN useradd --user-group heka \
    && mkdir /etc/heka



RUN yum -y install https://github.com/mozilla-services/heka/releases/download/v0.10.0/heka-0_10_0-linux-amd64.rpm && yum clean all

COPY plugins/modules /usr/share/heka/lua_modules/
COPY plugins/decoders /usr/share/heka/lua_decoders/
COPY plugins/encoders /usr/share/heka/lua_encoders/

COPY heka_sudoers /etc/sudoers.d/kolla_heka_sudoers
COPY extend_start.sh /usr/local/bin/kolla_extend_start

RUN usermod -a -G kolla heka \
    && chmod 440 /etc/sudoers.d/kolla_heka_sudoers \
    && chmod 755 /usr/local/bin/kolla_extend_start \
    && chown -R heka: /usr/share/heka /etc/heka





USER heka