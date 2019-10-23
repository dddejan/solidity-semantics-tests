#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

DIR=$1
shift

TOOLS="myth verisol smt-checker solc-verify"

for TOOL in $TOOLS;
do
  if [ -e "$RESULTS" ];
  then
     # Some RESULTS already there
     NEW_RESULTS=`mktemp`
     $SCRIPT_DIR/get_tool_results.sh "$TOOL" "$DIR" | join -t $'\t' $RESULTS - > $NEW_RESULTS
     RESULTS="$NEW_RESULTS"
  else
     # First one
     RESULTS=`mktemp`
     $SCRIPT_DIR/get_tool_results.sh $TOOL $DIR > $RESULTS
  fi
done

cat $RESULTS
