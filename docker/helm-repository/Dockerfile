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

FROM intelonp/centos-source-base:test_2
MAINTAINER Intel Corp. (http://www.intel.com)


ENV helm_version 2.1.3
ENV helm_port 8879
ENV helm_address 0.0.0.0









    


RUN yum -y install git jq python-pip && yum clean all

RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py \
    && python get-pip.py \
    && rm get-pip.py

RUN pip install pyyaml

RUN curl -Lo /tmp/helm-v${helm_version}-linux-amd64.tar.gz  http://storage.googleapis.com/kubernetes-helm/helm-v${helm_version}-linux-amd64.tar.gz \
    && sudo tar --strip-components 1 -C /usr/bin linux-amd64/helm -zxvf /tmp/helm-v${helm_version}-linux-amd64.tar.gz \
    && sudo chmod 755 /usr/bin/helm \
    && rm /tmp/helm-v${helm_version}-linux-amd64.tar.gz

RUN useradd --user-group --create-home --home-dir /home/helm helm \
    && sudo mkdir /helm-repo \
    && sudo chmod 755 /helm-repo \
    && sudo chown -R helm: /helm-repo/

USER helm

RUN helm init --client-only

CMD helm serve --address $helm_address:$helm_port --repo-path /helm-repo


