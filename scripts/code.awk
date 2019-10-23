BEGIN {
        total=0; correct=0; incorrect=0; timeout=0; unknown=0; unsupported=0; time=0.0;
      }
      {
        if ($1=="correct") { correct++ };
        if ($1=="incorrect") { incorrect++ };
        if ($1=="timeout") { timeout++ };
        if ($1=="unknown") { unknown++ };
        if ($1=="unsupported") { unsupported++ };
        time+=$2; total++;
      }
      END {
        print total, correct, incorrect, timeout, unknown, unsupported, time
      }