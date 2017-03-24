FROM intelonp/centos-source-mesos-base:17.04.0
MAINTAINER Intel Corp. (http://www.intel.com)



COPY docker.repo /etc/yum.repos.d/docker.repo

RUN rpm --import https://yum.dockerproject.org/gpg

RUN yum install -y \
        docker-engine \
    && yum clean all



ENV MESOS_CONTAINERIZERS docker
# Increase executor's timeout for pulling a Docker image to the slave
# https://mesosphere.github.io/marathon/docs/native-docker.html
ENV MESOS_EXECUTOR_REGISTRATION_TIMEOUT 5mins

CMD ["mesos-slave"]



# This container should run as a root, because it's talking to the Docker
# socket directly.