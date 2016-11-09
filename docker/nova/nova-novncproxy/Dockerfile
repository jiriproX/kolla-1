FROM intelonp/centos-source-nova-base:2.3.201610190134
MAINTAINER Intel Corp. (http://www.intel.com)







RUN mkdir -p /usr/share/nova-novncproxy-source && git clone https://github.com/kanaka/noVNC.git /usr/share/nova-novncproxy-source/nova-novncproxy && pushd /usr/share/nova-novncproxy-source/nova-novncproxy && git checkout 5230ab676472cc48c06237ea861938c905782651 && popd

RUN cd /usr/share \
    && ln -s nova-novncproxy-source/* novnc \
    && chown -R nova: /usr/share/nova-novncproxy-source







USER nova
