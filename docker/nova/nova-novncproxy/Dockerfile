FROM intelonp/centos-source-nova-base:2.3.201610190134
MAINTAINER Intel Corp. (http://www.intel.com)







RUN mkdir -p /usr/share/nova-novncproxy-source && git clone https://github.com/kanaka/noVNC.git /usr/share/nova-novncproxy-source/nova-novncproxy && pushd /usr/share/nova-novncproxy-source/nova-novncproxy && git checkout f75e4d3caa14bdeabba190d7465601e94aa97e03 && popd

RUN cd /usr/share \
    && ln -s nova-novncproxy-source/* novnc \
    && chown -R nova: /usr/share/nova-novncproxy-source







USER nova