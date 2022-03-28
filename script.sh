#!/bin/bash
projectName=$1
csvFile=$2
reportFile=$3
docker run --rm -v /var/lib/jenkins/workspace:/workspace swethapn14/repo_perf:JmeterLatest -Jjmeter.save.saveservice.output_format=xml -Jcsvfile=/var/lib/jenkins/workspace/$csvFile -n -t /var/lib/jenkins/workspace/$projectName -l /var/lib/jenkins/workspace/$reportFile
