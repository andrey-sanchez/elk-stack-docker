#!/bin/bash -x
#sudo sysctl -w vm.max_map_count=262144
sudo /usr/local/scripts/setup_vm_max_map_count_cassandra.sh 262144
