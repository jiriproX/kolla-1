FROM intelonp/centos-source-nova-base:2.4.201703130523
MAINTAINER Intel Corp. (http://www.intel.com)







    

        

    

RUN yum -y install httpd mod_wsgi && yum clean all



COPY extend_start.sh /usr/local/bin/kolla_nova_extend_start
RUN chmod 755 /usr/local/bin/kolla_nova_extend_start




USER nova