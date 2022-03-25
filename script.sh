#!/bin/bash
projectName=$1
csvFile=$2
reportFile=$3
sudo docker run --rm -v /home/ubuntugrafico/ProyectodePruebaJmetter/PruebaJmetter:/workspace swethapn14/repo_perf:JmeterLatest -Jjmeter.save.saveservice.output_format=xml -Jcsvfile=/workspace/$csvFile -n -t /workspace/$projectName -l /workspace/$reportFile
