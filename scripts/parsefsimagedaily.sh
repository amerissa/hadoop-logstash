rm -rf /etc/logstash/scripts/fsimagedaily.csv.*
sleep 30
while ps aux | grep fsimage.sh | grep -qv grep; do
sleep 5
done
parsedfile=`ls /etc/logstash/scripts/fsimage.csv.*`
cp $parsedfile /etc/logstash/scripts/fsimagedaily.csv.$(date +'%s')
