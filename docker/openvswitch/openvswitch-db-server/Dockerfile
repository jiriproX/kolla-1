FROM intelonp/centos-source-openvswitch-base:2.3.201610190134
MAINTAINER Intel Corp. (http://www.intel.com)



COPY ovs_ensure_configured.sh /usr/local/bin/kolla_ensure_openvswitch_configured
COPY extend_start.sh /usr/local/bin/kolla_openvswitch_extend_start
COPY start_ovsdb_server.sh /usr/local/bin/start-ovsdb-server
RUN chmod 755 /usr/local/bin/kolla_ensure_openvswitch_configured \
              /usr/local/bin/kolla_openvswitch_extend_start \
              /usr/local/bin/start-ovsdb-server



