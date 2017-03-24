FROM intelonp/centos-source-kube-base:2.4.201703130523
MAINTAINER Intel Corp. (http://www.intel.com)

ENV KUBERNETES_COMPONENT=kube-apiserver

RUN true \
    && curl -L ${KUBERNETES_DOWNLOAD_ROOT}/${KUBERNETES_COMPONENT} -o /usr/bin/${KUBERNETES_COMPONENT} \
    && chmod +x /usr/bin/${KUBERNETES_COMPONENT}

# Clear any customisation by Kolla to entrypoint & command
ENTRYPOINT []
CMD []