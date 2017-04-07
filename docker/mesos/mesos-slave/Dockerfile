# Copyright (c) 2017, Intel Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FROM intelonp/centos-source-mesos-base:001
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