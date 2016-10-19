FROM intelonp/centos-source-openstack-base:2.3.201610190134
MAINTAINER Intel Corp. (http://www.intel.com)






    
        
RUN yum -y install httpd mod_wsgi python-ldappool && yum clean all
RUN sed -i -r 's,^(Listen 80),#\1,' /etc/httpd/conf/httpd.conf

    


RUN mkdir -p /keystone-base-source && git clone git://git.openstack.org/openstack/keystone /keystone-base-source/keystone-base && pushd /keystone-base-source/keystone-base && git checkout 339e7cc798aed24b7697980eb7cf8e20498d436d && popd

RUN ln -s keystone-base-source/* keystone \
    && useradd --user-group --create-home --home-dir /var/lib/keystone keystone \
    && /var/lib/kolla/venv/bin/pip --no-cache-dir install --upgrade -c requirements/upper-constraints.txt /keystone \
    && mkdir -p /etc/keystone /var/www/cgi-bin/keystone /var/log/apache2 \
    && cp -r /keystone/etc/* /etc/keystone/ \
    && cp /var/lib/kolla/venv/bin/keystone-wsgi-admin /var/www/cgi-bin/keystone/admin \
    && cp /var/lib/kolla/venv/bin/keystone-wsgi-public /var/www/cgi-bin/keystone/main \
    && chown -R keystone: /etc/keystone /var/www/cgi-bin/keystone /var/log/apache2




RUN usermod -a -G kolla keystone \
    && chown -R keystone: /var/www/cgi-bin/keystone \
    && chmod 755 /var/www/cgi-bin/keystone/*


