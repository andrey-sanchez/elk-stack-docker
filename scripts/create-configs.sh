#!/usr/bin/env python
import json
import math
from os import remove,path
from shutil import copyfile

port = 9200
clusterInfoPath = '/etc/cluster.info'

clusterInfo = json.load(open(clusterInfoPath))
clusterName = clusterInfo["clusterName"]
instanceName = clusterInfo["instanceInfo"]["name"]
instanceIp = clusterInfo["instanceInfo"]["privateAddr"]
allInterfaces = "0.0.0.0"

instanceFullName = clusterInfo["instanceInfo"]["fqdn"]
instances = len(clusterInfo["instances"]) + 1
quorum = int(math.ceil(instances / 2.0))
print "Cluster Name: " + clusterName
print "Instance name: " + instanceName
print "Instances: " + `instances`
print "Quorum: " + `quorum`

if path.isfile("elasticsearch/config/elasticsearch.yml"):
  remove("elasticsearch/config/elasticsearch.yml")

with open("elasticsearch/config/elasticsearch.yml", "a") as config:
    config.write("cluster.name: \"" + clusterName + "\"\n")
    config.write("node.name: \"" + instanceName + "\"\n")
    config.write("network.host: " + allInterfaces + "\n")
    config.write("http.port: " + `port` + "\n")
    config.write("discovery.zen.ping.unicast.hosts: [")#: ["host1", "host2"]
    config.write("\"" + instanceFullName + "\"")
    for inst in clusterInfo["instances"]:
      config.write(", \"" + inst["fqdn"] + "\"")
    config.write("]\n")
    config.write("discovery.zen.minimum_master_nodes: " + `quorum` + "\n")
    config.write("gateway.recover_after_nodes: " + `quorum` + "\n")
    config.write("node.master: true\n")
    config.write("node.data: true\n")
    