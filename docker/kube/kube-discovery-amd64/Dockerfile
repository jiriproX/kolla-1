FROM intelonp/centos-source-kube-base:2.4.201703130523
MAINTAINER Intel Corp. (http://www.intel.com)

ENV KUBERNETES_COMPONENT=kube-discovery

# To match upstream we load the binary to /usr/local/bin
RUN true \
    && curl -L ${KUBERNETES_DOWNLOAD_ROOT}/${KUBERNETES_COMPONENT} -o /usr/local/bin/${KUBERNETES_COMPONENT} \
    && chmod +x /usr/local/bin/${KUBERNETES_COMPONENT}

# Clear any customisation by Kolla to entrypoint & command
ENTRYPOINT []
CMD []