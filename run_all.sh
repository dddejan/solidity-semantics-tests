#!/bin/bash

# how many threads
PARALLEL=$1
if [ -z "$PARALLEL" ]; then PARALLEL=1; fi

# directory of the script
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# all the tools
TOOLS="smt-checker myth solc-verify verisol"
TOOLS_ARRAY=($TOOLS)
TOOLS_COUNT=${#TOOLS_ARRAY[@]}

echo Running $TOOLS_COUNT tools: $TOOLS

# all the files
FILES=$(find contracts -name "*.sol")
FILES_ARRAY=($FILES)
FILES_COUNT=${#FILES_ARRAY[@]}

echo Number of benchmarks: $FILES_COUNT

# total number of things to run
TOTAL=$((FILES_COUNT*TOOLS_COUNT))

echo Total: $TOTAL
echo Parallel: $PARALLEL

(

for THREAD in `seq 0 1 $PARALLEL`;
do
  # get the files for this thread
  THREAD_FILES=$(find contracts -name "*.sol" | awk "NR % $PARALLEL == $THREAD")
  (
    # run everythin and save output
    for FILE in $THREAD_FILES;
    do
      for TOOL in $TOOLS;
      do
        echo "[$THREAD] Running $FILE with $TOOL"
        (docker run solc-verify-examples /solc-verify-examples/scripts/run_tool.sh $TOOL $FILE) > "$FILE"."$TOOL" 2>&1
      done
    done
  ) &
  # remember the pid
  PIDS[$THREAD]=$!
done

# wait for all the processes to finish
for PID in ${PIDS[*]}; do
  wait $PID
done

) | ./progressbar.sh $TOTAL

