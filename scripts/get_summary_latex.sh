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

# We do name | correct | incorrect | unsupported | timeout | time
cat << SSS
\begin{tabular}{| l | c  c  c  c | r |}
SSS

for SUBDIR in $DIR/*
do
if [ -d "$SUBDIR" ];
then

  COUNT=$(grep -c "$SUBDIR/" $RESULTS_FILE)
  TOTAL=$(find "$SUBDIR/" -name "*.sol" | wc -l | awk '{print $1}')

  TOTAL_BENCHMARKS=$(($TOTAL_BENCHMARKS+$TOTAL))
  TOTAL_RUN=$(($TOTAL_RUN+$COUNT))

  if [ "$COUNT" -eq "0" ]; then continue; fi;

  SET=$(echo $SUBDIR | sed s/'.*\/'//g)

cat << SSS
\hline
\rowcolor[gray]{.95}
\textsf{$SET} ($TOTAL) & correct & incorrect & unsupported & timeout & time (s) \\\\
\hline
SSS

(
  for INDEX in ${!TOOLS[@]};
  do
    TOOL=$(echo ${TOOLS[$INDEX]} | sed s/'-'//g)
    echo -n "\\$TOOL"
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
        if ($1=="unknown") { correct++ };
        if ($1=="unsupported") { unsupported++ };
        if (!($1=="timeout")) {
          time+=$2;
        }
      }
      END {
        printf " & %d & %d & %d & %d & %5.2f \\\\ \n", correct, incorrect, unsupported, timeout, time
      }
      '
  done
)

  echo
fi
done

# We do name | correct | incorrect | unsupported | timeout | time
cat << SSS
\hline
\end{tabular}
SSS
