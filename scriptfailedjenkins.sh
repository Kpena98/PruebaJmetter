#!/bin/bash
import sys
grep "false" $WORKSPACE/$reportFile
sys.exit(1)
