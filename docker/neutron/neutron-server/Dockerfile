FROM intelonp/centos-source-neutron-base:2.4.20170320
MAINTAINER Intel Corp. (http://www.intel.com)









ADD plugins-archive /
COPY extend_start.sh /usr/local/bin/kolla_neutron_extend_start
RUN chmod 755 /usr/local/bin/kolla_neutron_extend_start \
    && if [ "$(ls /plugins)" ]; then \
           pip --no-cache-dir install --upgrade -c requirements/upper-constraints.txt /plugins/*; \
       fi




USER neutron