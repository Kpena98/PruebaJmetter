#!/bin/bash
csvFile=$1
projectName=$2
reportFile=$3
DIA=`date +"%d/%m/%Y"`
HORA=`date +"%H:%M"`
docker run --rm -v $WORKSPACE:/workspace swethapn14/repo_perf:JmeterLatest -Jjmeterengine.stopfail.system.exit=true -Jjmeter.save.saveservice.output_format=xml -Jcsvfile=/workspace/$csvFile -n -t /workspace/$projectName -l /workspace/$reportFile
if grep "false" $reportFile > resultadoemail.txt
##&& grep $JOB_NAME > resultadoemail.txt && grep $DATE > resultadoemail.txt
then 
echo El test fallo
exit 1
else grep "true" $WORKSPACE/$reportFile > resultadoemail.txt
$JOB_NAME > resultadoemail.txt
echo El test finalizo correctamente
exit 0
fi
