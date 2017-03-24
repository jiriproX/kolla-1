FROM intelonp/centos-source-ovsdpdk:2.4.201703130523
MAINTAINER Intel Corp. (http://www.intel.com)



COPY ovs_ensure_configured.sh /usr/local/bin/kolla_ensure_ovsdpdk_configured
COPY extend_start.sh /usr/local/bin/kolla_ovsdpdk_extend_start
COPY start_ovsdb_server.sh /usr/local/bin/start-ovsdb-server
RUN chmod 755 /usr/local/bin/kolla_ensure_ovsdpdk_configured \
              /usr/local/bin/kolla_ovsdpdk_extend_start \
              /usr/local/bin/start-ovsdb-server


