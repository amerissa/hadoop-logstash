ambariHost="http://localhost.localdomain:8080"
clustername="hd0"
username='admin'
password='admin'
curl -k -s -u ${username}:${password} ${ambariHost}/api/v1/clusters/${clustername}/alerts?fields=* | /etc/logstash/scripts/json -a items | /etc/logstash/scripts/json -c "this.Alert.maintenance_state != 'ON'"  -c "this.Alert.state == 'CRITICAL'" -c  "this.Alert.original_timestamp > `date +%s%3N -d "1 min ago"`" -a Alert.component_name Alert.definition_name Alert.host_name Alert.id Alert.instance Alert.label Alert.occurrences Alert.state Alert.service_name -d ,
