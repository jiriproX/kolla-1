FROM intelonp/centos-source-ironic-base:2.4.20170321
MAINTAINER Intel Corp. (http://www.intel.com)






    
        
    
RUN /var/lib/kolla/venv/bin/pip --no-cache-dir install --upgrade -c requirements/upper-constraints.txt -r /ironic/driver-requirements.txt


RUN yum -y install dosfstoolsutil-linux qemu-img ipmitool parted gdisk psmisc fuse && yum clean all




USER ironic