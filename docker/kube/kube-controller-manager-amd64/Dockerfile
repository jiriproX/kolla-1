FROM intelonp/centos-source-kube-base:17.04.0-test
MAINTAINER Intel Corp. (http://www.intel.com)

ENV KUBERNETES_COMPONENT=kube-controller-manager




   

RUN yum -y install ceph-common && yum clean all

RUN true \
    && curl -L ${KUBERNETES_DOWNLOAD_ROOT}/${KUBERNETES_COMPONENT} -o /usr/bin/${KUBERNETES_COMPONENT} \
    && chmod +x /usr/bin/${KUBERNETES_COMPONENT}

# Clear any customisation by Kolla to entrypoint & command
ENTRYPOINT []
CMD []