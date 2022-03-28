#!/bin/bash
projectName=$1
csvFile=$2
reportFile=$3
docker run --rm -v $WORKSPACE:/workspace swethapn14/repo_perf:JmeterLatest -Jjmeter.save.saveservice.output_format=xml -Jcsvfile=/workspace/cuenta.csv -n -t /workspace/PPM2-0.jmx -l /workspace/jenkins.jtl
