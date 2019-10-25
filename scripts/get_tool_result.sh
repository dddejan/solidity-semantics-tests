#!/bin/bash

TOOL="$1"
BENCH="$2"
FILE="$BENCH"."$TOOL"

echo -n $BENCH$'\t'

case $TOOL in
  myth)
    grep 'A reachable exception has been detected' $FILE >& /dev/null
    if [ $? -eq 0 ];
    then
      echo -n "incorrect"
    else
      grep 'Command terminated by signal 24' $FILE >& /dev/null
      if [ $? -eq 0 ];
      then
        echo -n "timeout"
      else
        echo -n "correct"
      fi
    fi
    ;;
  smt-checker)
    grep 'Assertion checker does not yet' $FILE >& /dev/null
    if [ $? -eq 0 ];
    then
      echo -n 'unsupported'
    else
      grep 'Assertion violation' $FILE >& /dev/null
      if [ $? -eq 0 ];
      then
        echo -n 'incorrect'
      else
        echo -n 'correct'
      fi
    fi
    ;;
  solc-verify)
    grep SKIPPED $FILE >& /dev/null
    if [ $? -eq 0 ];
    then
      echo -n "unsupported"
    else
      grep "Assertion might not hold" $FILE >& /dev/null
      if [ $? -eq 0 ];
      then
        echo -n "incorrect"
      else
        echo -n "correct"
      fi
    fi
    ;;
  verisol)
    grep 'Did not find a proof' $FILE >& /dev/null
    if [ $? -eq 0 ];
    then
      grep 'Found a counterexample' $FILE >& /dev/null
      if [ $? -eq 0 ];
      then
        echo -n "incorrect"
      else
        echo -n "unknown"
      fi
    else
      grep 'Command exited with non-zero status 1' $FILE >& /dev/null
      if [ $? -eq 0 ];
      then
        echo -n "unsupported"
      else
        echo -n "correct"
      fi
    fi
    ;;
esac

# get the time
echo -n $'\t'
grep 'user.*system' $FILE | sed s/'user.*'//g