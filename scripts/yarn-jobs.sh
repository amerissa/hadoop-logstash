resourcemanager='localhost.localdomain:8088'

case $1 in 

running)

curl -s -L -k  ${resourcemanager}/ws/v1/cluster/apps | /etc/logstash/scripts/json apps.app | /etc/logstash/scripts/json -c "this.state === 'RUNNING'" -e "this.elapsedTime = this.elapsedTime/1000" -a -a id user queue state finalStatus progress applicationType startedTime finishedTime elapsedTime allocatedMB allocatedVCores runningContainers memorySeconds vcoreSeconds queueUsagePercentage clusterUsagePercentage preemptedResourceMB preemptedResourceVCores name -d ,
;;

completed)
curl -s -L -k ${resourcemanager}/ws/v1/cluster/apps | /etc/logstash/scripts/json apps.app | /etc/logstash/scripts/json -c "this.state === 'FINISHED'" -c "this.finishedTime >= `date +%s%3N -d "1 min ago"`" -e "this.elapsedTime = this.elapsedTime/1000" -a -a id user queue state finalStatus progress applicationType startedTime finishedTime elapsedTime allocatedMB allocatedVCores runningContainers memorySeconds vcoreSeconds queueUsagePercentage clusterUsagePercentage preemptedResourceMB preemptedResourceVCores name -d ,

;;
esac
