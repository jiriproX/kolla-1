FROM intelonp/centos-source-nova-base:2.3.201610190134
MAINTAINER Intel Corp. (http://www.intel.com)







    



RUN yum -y install libvirt-daemon libguestfs qemu-kvm libvirt-daemon-driver-nwfilter libvirt-daemon-config-nwfilter libvirt-daemon-driver-lxc ceph-common && yum clean all



RUN usermod -a -G qemu nova



COPY extend_start.sh /usr/local/bin/kolla_extend_start
RUN chmod 755 /usr/local/bin/kolla_extend_start



