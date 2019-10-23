#!/bin/bash

tool="$1"
shift
bench="$1"
shift
options="$@"

echo Running $bench

# timelimit 1min (in s)
timelimit=600

# cpu time limit
ulimit -S -t $timelimit &> /dev/null
ulimit -H -t $((1+$timelimit)) &> /dev/null

# memlimit 64GB (in KB)
memlimit=67108864

# memlimit
ulimit -v $memlimit &> /dev/null

case $tool in
  myth)
    cmdline="myth a $bench"
    ;;
  smt-checker)
    tmpfile=$(mktemp smt_checker_input_XXXX)
    echo "pragma experimental SMTChecker;" > $tmpfile
    cat $bench >> $tmpfile
    # Use the same solc as solc-verify, the apt version doesn't have smt-checker
    # What a hack: get it from solc-verify help so lots of sed/grep
    # Need to do multiline crap because it can be long and span multiple lines
    n1=$(solc-verify.py --help | grep -n SOLC | tail -n 1 | sed s/':.*'//)
    n2=$(solc-verify.py --help | tail -n +$n1 | grep 'solc)' -n | sed s/':.*'//)
    lines=$(solc-verify.py --help | tail -n +$n1 | head -n +$n2 | grep '/' | sed s/'.*(default: '// | sed s/')'//)
    solcbin=$(echo $lines | sed s/' '//g)
    cmdline="$solcbin $tmpfile"
    ;;
  solc-verify)
    cmdline="solc-verify.py --timeout $timelimit $options $bench"
    ;;
  verisol)
    verisoldll=$(locate VeriSol.dll)
    contract=$(grep contract $bench | sed s/'\S* '// | sed s/' .*'//)
    cmdline="dotnet $verisoldll $bench $contract"
    ;;
esac

# run the problem
/usr/bin/time $cmdline

# remove temp
[ ! -z "$tmpfile" ] && rm $tmpfile