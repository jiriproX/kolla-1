FROM intelonp/centos-source-nova-base:17.04.0
MAINTAINER Intel Corp. (http://www.intel.com)






    

        

RUN yum -y install httpd mod_wsgi && yum clean all
RUN sed -i -r 's,^(Listen 80),#\1,' /etc/httpd/conf/httpd.conf
    


COPY extend_start.sh /usr/local/bin/kolla_nova_extend_start
RUN chmod 755 /usr/local/bin/kolla_nova_extend_start


