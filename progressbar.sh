#!/usr/bin/env python2

from tqdm import tqdm
import sys

total_benchmarks = int(sys.argv[1])
with tqdm(total=total_benchmarks, ascii=False, unit='bench', dynamic_ncols=True) as pb:
  while True:
    line = sys.stdin.readline()
    if not line: break 
    pb.update()

