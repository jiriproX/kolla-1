FROM intelonp/centos-source-freezer-base:2.4.20170321
MAINTAINER Intel Corp. (http://www.intel.com)







    
        

RUN yum -y install mod_wsgi httpd && yum clean all

RUN sed -i -r 's,^(Listen 80),#\1,' /etc/httpd/conf/httpd.conf
    

RUN mkdir -p /freezer-api-source && git clone http://tarballs.openstack.org/freezer-api/freezer-api-master.tar.gz /freezer-api-source/freezer-api && pushd /freezer-api-source/freezer-api && git checkout None && popd

RUN ln -s freezer-api-source/* freezer-api \
    && /var/lib/kolla/venv/bin/pip --no-cache-dir install --upgrade -c requirements/upper-constraints.txt /freezer-api \
    && cp -r /freezer-api/etc/freezer/* /etc/freezer/



COPY extend_start.sh /usr/local/bin/kolla_freezer_extend_start
RUN chmod 755 /usr/local/bin/kolla_freezer_extend_start

