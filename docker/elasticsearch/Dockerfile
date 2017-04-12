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

FROM intelonp/centos-source-base:0015
MAINTAINER Intel Corp. (http://www.intel.com)







RUN usermod --append --home /usr/share/elasticsearch --groups kolla elasticsearch \
    && chsh --shell /bin/bash elasticsearch \
    && mkdir -p /usr/share/elasticsearch \
    && chown -R 42412:42412 /usr/share/elasticsearch



    

ENV JAVA_HOME /usr/lib/jvm/jre-1.7.0-openjdk/



RUN yum -y install java-1.7.0-openjdk elasticsearch && yum clean all
COPY elasticsearch_sudoers /etc/sudoers.d/kolla_elasticsearch_sudoers
COPY extend_start.sh /usr/local/bin/kolla_extend_start

# NOTE: By default the shell of the elasticsearch user is /bin/false. We have to
# change the shell to /bin/bash to be able to run elasticsearch as a non-root user.
#
# https://discuss.elastic.co/t/running-as-non-root-user-service-wrapper-has-changed/7863

RUN chmod 755 /usr/local/bin/kolla_extend_start \
    && chmod 750 /etc/sudoers.d \
    && chmod 440 /etc/sudoers.d/kolla_elasticsearch_sudoers




USER elasticsearch