kinit -kt /etc/logstash/scripts/hdfs.headless.keytab hdfs-hd0

rm -f /etc/logstash/scripts/fsimage_*
hdfs dfsadmin -fetchImage /etc/logstash/scripts/
fsimage=`ls /etc/logstash/scripts/fsimage_*`
rm -rf /etc/logstash/scripts/fsimage.csv.*
hdfs oiv -t /etc/logstash/scripts/scratch/ -delimiter "|" -p Delimited -i $fsimage |  sed '1d' | sed  's/\"//g' |sed 's/\s//g'   > /etc/logstash/scripts/fsimage.csv.$(date +'%s')
