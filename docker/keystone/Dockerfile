FROM intelonp/centos-source-openstack-base:17.04.0
MAINTAINER Intel Corp. (http://www.intel.com)


    

RUN yum -y install \
        httpd \
        mod_wsgi \
    && yum clean all \
    && sed -i -r 's,^(Listen 80),#\1,' /etc/httpd/conf/httpd.conf

    

RUN mkdir -p /keystone-source && git clone None /keystone-source/keystone && pushd /keystone-source/keystone && git checkout None && popd

RUN ln -s keystone-source/* keystone \
    && useradd --user-group keystone \
    && /var/lib/kolla/venv/bin/pip --no-cache-dir install --upgrade -c requirements/upper-constraints.txt /keystone \
    && mkdir -p /etc/keystone /var/www/cgi-bin/keystone /var/log/apache2 /home/keystone \
    && cp -r /keystone/etc/* /etc/keystone/ \
    && cp /keystone/httpd/keystone.py /var/www/cgi-bin/keystone/admin \
    && cp /keystone/httpd/keystone.py /var/www/cgi-bin/keystone/main \
    && chown -R keystone: /etc/keystone /var/www/cgi-bin/keystone /var/log/apache2 /home/keystone



# NOTE(SamYaple): This is to reintroduce a deprecated option as a quick-fix
# until the correct new procedure is implemented.
# TODO(SamYaple): Replace this with `keystone-manage bootstrap`
RUN sed -i 's|token_auth json_body|token_auth admin_token_auth json_body|g' /etc/keystone/keystone-paste.ini

RUN usermod -a -G kolla keystone \
    && chown -R keystone: /var/www/cgi-bin/keystone \
    && chmod 755 /var/www/cgi-bin/keystone/*

COPY extend_start.sh /usr/local/bin/kolla_extend_start
RUN chmod 755 /usr/local/bin/kolla_extend_start
