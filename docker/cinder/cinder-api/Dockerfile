FROM intelonp/centos-source-cinder-base:17.04.0
MAINTAINER Intel Corp. (http://www.intel.com)






    
        
    
RUN yum -y install httpd mod_wsgi && yum clean all



COPY extend_start.sh /usr/local/bin/kolla_cinder_extend_start
RUN chmod 755 /usr/local/bin/kolla_cinder_extend_start




USER cinder