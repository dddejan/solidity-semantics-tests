#!/bin/bash

TOOL="$1"
DIR="$2"

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo benchmark$'\t'result$'\t'time

for FILE in $(find $DIR -name "*.sol" | sort);
do
  $SCRIPT_DIR/get_tool_result.sh $TOOL $FILE
done


