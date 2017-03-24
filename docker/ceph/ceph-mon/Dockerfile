FROM intelonp/centos-source-ceph-base:17.04.0-test
MAINTAINER Intel Corp. (http://www.intel.com)



COPY fetch_ceph_keys.py /usr/bin/

COPY extend_start.sh /usr/local/bin/kolla_extend_start
RUN chmod 755 /usr/local/bin/kolla_extend_start /usr/bin/fetch_ceph_keys.py


