#!/bin/bash

ovsdb_ip=$1
ovs_bridge=$2
ovs_ext_intf=$3

if [ ! -e $ovs_bridge  ] && [ ! -e $ovs_ext_intf  ]; then
# Creating external bridge
    /usr/sbin/ovsdb-server /etc/openvswitch/conf.db --remote=punix:/var/run/openvswitch/db.sock --run="ovs-vsctl --no-wait --db=unix:/var/run/openvswitch/db.sock add-br $ovs_bridge"
# Plug the external interface into the external bridge.
    /usr/sbin/ovsdb-server /etc/openvswitch/conf.db --remote=punix:/var/run/openvswitch/db.sock --run="ovs-vsctl --no-wait --db=unix:/var/run/openvswitch/db.sock add-port $ovs_bridge $ovs_ext_intf"
# Run ovsdb server proces
    /usr/sbin/ovsdb-server /etc/openvswitch/conf.db -vconsole:emer -vsyslog:err -vfile:info --remote=punix:/var/run/openvswitch/db.sock --remote=ptcp:6640 --log-file=/var/log/kolla/openvswitch/ovsdb-server.log
else
# NOTE: (sbezverk) This part is executed only by kolla-ansible deployment.
    /usr/sbin/ovsdb-server /etc/openvswitch/conf.db -vconsole:emer -vsyslog:err -vfile:info --remote=punix:/run/openvswitch/db.sock --remote=ptcp:6640:$ovsdb_ip --log-file=/var/log/kolla/openvswitch/ovsdb-server.log
fi
