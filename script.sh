#!/bin/bash
csvFile=$1
projectName=$2
reportFile=$3
docker run --rm -v $WORKSPACE:/workspace swethapn14/repo_perf:JmeterLatest -Jjmeterengine.stopfail.system.exit=true -Jjmeter.save.saveservice.output_format=xml -Jcsvfile=/workspace/$csvFile -n -t /workspace/$projectName -l /workspace/$reportFile
if grep "false" $reportFile > $WORKSPACE/resultadoemail.txt && grep $JOB_NAME > $WORKSPACE/resultadoemail.txt && grep $DATE > $WORKSPACE/resultadoemail.txt
then 
echo El test fallo
exit 1
else grep "true" $reportFile > resultadoemail.txt && grep $JOB_NAME > $WORKSPACE/resultadoemail.txt && grep $DATE > $WORKSPACE/resultadoemail.txt 
echo El test finalizo correctamente
exit 0
fi
