#!/bin/bash

ambariHost='http://localhost.localdomain:8080'
username='admin'
password='admin'
clustername='hd0'

serviceinfo=`curl -s -u $username:$password ${ambariHost}/api/v1/clusters/$clustername/alerts/$1 | /etc/logstash/scripts/json -a Alert.cluster_name Alert.host_name Alert.component_name -d ,`

hostname=`echo $serviceinfo | cut -d , -f 2`
component=`echo $serviceinfo | cut -d , -f 3`


curl -s -u $username:$password -H 'X-Requested-By: ambari' -X PUT -d '{"HostRoles": {"state": "STARTED"}}' ${ambariHost}/api/v1/clusters/$clustername/hosts/$hostname/host_components/$component
