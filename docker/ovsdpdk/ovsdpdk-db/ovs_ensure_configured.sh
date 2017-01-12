#!/bin/bash

bridge=$1
port=$2
ovs_datapath=${3:-"system"}
dpdk_lcore_mask=${4:-"0x02"}
pmd_cpu_mask=${5:-"0x06"}
dpdk_socket_mem=${6:-"2048"}
interface_type=""

ovs-vsctl br-exists $bridge; rc=$?
if [[ $rc == 2 ]]; then
    changed=changed
    ovs-vsctl --no-wait add-br $bridge -- set bridge $bridge datapath_type=$ovs_datapath
fi

if [[ ! $(ovs-vsctl list-ports $bridge) =~ $(echo "\<$port\>") ]]; then
    changed=changed
    cmd="ovs-vsctl --no-wait add-port $bridge $port"
    #NOTE(sean-k-mooney): the dpdk port name must be dpdk0
    [[ "$ovs_datapath" == "netdev" ]] && cmd="ovs-vsctl --no-wait add-port $bridge dpdk0 -- set interface dpdk0 type=dpdk"
    $cmd
fi

if [[ "$ovs_datapath" == "netdev" ]]; then
    ovs-vsctl --no-wait set Open_vSwitch . other_config:pmd-cpu-mask=$pmd_cpu_mask other_config:dpdk-init=True other_config:dpdk-lcore-mask=$dpdk_lcore_mask \
    other_config:dpdk-mem-channels=4 other_config:dpdk-socket-mem=$dpdk_socket_mem other_config:dpdk-hugepage-dir=/dev/hugepages
fi

echo $changed
