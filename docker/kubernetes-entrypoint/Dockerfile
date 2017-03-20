FROM intelonp/centos-source-base:2.4.20170320
MAINTAINER Intel Corp. (http://www.intel.com)



RUN curl -Lo /usr/local/bin/kubernetes-entrypoint https://github.com/stackanetes/kubernetes-entrypoint/releases/download/v0.1.1/kubernetes-entrypoint \
    && chmod 755 /usr/local/bin/kubernetes-entrypoint



CMD /usr/local/bin/kubernetes-entrypoint