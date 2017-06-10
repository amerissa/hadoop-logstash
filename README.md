# hadoop-logstash

NOTE: IF you have snapshots, hadoop 2.7 has a bug, you can get the binary of hadoop 2.8 to run the hdfs oiv

*FS Image parsing:

* It checks the growth size in the fsimagedaily index. Also edit the template to group items into specific groupings. Check the filter.conf for an example

* Normal index will only record elements that have an updated accesstime. You can monitor access times for specific directories. Helps in making decisions for access policies

*Ambari Service Check:

* Checks and records service issues. 
* If a component is down it will auto restart

*YARN Applications:

* It records applications that are running and completed. Records plenty of information


*Install:

Place both conf and scripts directory into /etc/logstash. Make sure to update specific environment settings in your scripts. 

