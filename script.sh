#!/bin/bash
csvFile=$1
projectName=$2
reportFile=$3
docker run --rm -v $WORKSPACE:/workspace swethapn14/repo_perf:JmeterLatest -Jjmeterengine.stopfail.system.exit=true -Jjmeter.save.saveservice.output_format=xml -Jcsvfile=/workspace/$csvFile -n -t /workspace/$projectName -l /workspace/$reportFile
if grep "false" $WORKSPACE/$reportFile
then 
echo El test fallo
exit 1
fi
grep "false" > reporteResumido.txt
