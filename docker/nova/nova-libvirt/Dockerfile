FROM intelonp/centos-source-base:17.04.0
MAINTAINER Intel Corp. (http://www.intel.com)








RUN usermod --append --home /var/lib/nova --groups kolla nova \
    && usermod --append --groups qemu nova \
    && mkdir -p /var/lib/nova \
    && chown -R 42436:42436 /var/lib/nova




    



RUN yum -y install libvirt-daemon libguestfs openvswitch qemu-kvm libvirt-daemon-driver-nwfilter libvirt-daemon-config-nwfilter libvirt-daemon-driver-lxc ceph-common && yum clean all



COPY extend_start.sh /usr/local/bin/kolla_extend_start
RUN chmod 755 /usr/local/bin/kolla_extend_start


