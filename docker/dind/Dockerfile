FROM intelonp/centos-source-openstack-base:17.04.0-test
MAINTAINER Intel Corp. (http://www.intel.com)







# Since the gate cannot do DinD on centos due to the age of the kernel, we don't
# build a true DinD image. Should the time come that we get a newer kernel in
# the centos gate and we want to do multinode we can populate this container
RUN /bin/true



COPY start.sh /usr/local/bin/kolla_start
RUN chmod 755 /usr/local/bin/kolla_start


