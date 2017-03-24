FROM intelonp/centos-source-base:2.4.201703130523
MAINTAINER Intel Corp. (http://www.intel.com)








RUN usermod --append --home /var/lib/ceph --groups kolla ceph \
    && mkdir -p /var/lib/ceph \
    && chown -R 64045:64045 /var/lib/ceph



   

RUN yum -y install ceph ceph-fuse ceph-radosgw parted hdparm btrfs-progs xfsprogs e2fsprogs && yum clean all

COPY extend_start.sh /usr/local/bin/kolla_extend_start
RUN chmod 755 /usr/local/bin/kolla_extend_start

