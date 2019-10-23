#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DIR=$1
TOOLS=(myth verisol smt-checker solc-verify)

RESULTS_FILE=$(mktemp)
$SCRIPT_DIR/get_results.sh $DIR > $RESULTS_FILE

TIMES=()
RESULTS=()

HEADER=$(head -n 1 $RESULTS_FILE)
INDEX=1;

for FIELD in $HEADER;
do
  if [ "$FIELD" = "result" ]
  then
    RESULTS+=($INDEX)
  fi

  if [ "$FIELD" = "time" ]
  then
    TIMES+=($INDEX)
  fi

  INDEX=$((INDEX+1))
done

TOTAL_BENCHMARKS=0
TOTAL_RUN=0

for SUBDIR in $DIR/*
do
if [ -d "$SUBDIR" ];
then

  COUNT=$(grep -c "$SUBDIR/" $RESULTS_FILE)
  TOTAL=$(find "$SUBDIR/" -name "*.sol" | wc -l | awk '{print $1}')

  TOTAL_BENCHMARKS=$(($TOTAL_BENCHMARKS+$TOTAL))
  TOTAL_RUN=$(($TOTAL_RUN+$COUNT))

  if [ "$COUNT" -eq "0" ]; then continue; fi;

  echo "$SUBDIR ($COUNT/$TOTAL)"

(
  echo tool$'\t'correct$'\t'incorrect$'\t'unsupported$'\t'unknown$'\t'timeout$'\t'time
  for INDEX in ${!TOOLS[@]};
  do
    echo -n "${TOOLS[$INDEX]}"$'\t'
    CRESULT=${RESULTS[$INDEX]}
    CTIME=${TIMES[$INDEX]}

    grep "$SUBDIR/" $RESULTS_FILE |
    awk -v c1=$CRESULT -v c2=$CTIME '{ print $c1, $c2; }' |
    grep -E 'correct|incorrect|timeout|unknown|unsupported' |
    awk '
      BEGIN {
        correct=0; incorrect=0; timeout=0; unknown=0; unsupported=0; time=0.0;
      }
      {
        if ($1=="correct") { correct++ };
        if ($1=="incorrect") { incorrect++ };
        if ($1=="timeout") { timeout++ };
        if ($1=="unknown") { unknown++ };
        if ($1=="unsupported") { unsupported++ };
        if (!($1=="timeout")) {
          time+=$2;
        }
      }
      END {
        print correct, incorrect, unsupported, unknown, timeout, time
      }
      '
  done
) | column -t

  echo
fi
done

