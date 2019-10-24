# Docker setup

To construct the docker tun

```
docker build -t solc-verify-examples .
```

To experiment with the docker run

```
docker run -it solc-verify-examples /bin/bash
```

# To run the tests

Running with 8 in parallel (needs docker already build)

```
./run_all.sh 8
```

# To get individual results for a tool

```
./scripts/get_tool_results.sh verisol contracts
```

Log file of an individual run of `tool` on contract `C.sol` is saved in `C.sol.tool`.

# To get the summary results

```
$ ./scripts/get_summary.sh contracts
contracts/assigment (102/102)
tool         correct  incorrect  unsupported  unknown  timeout  time
myth         94       0          0            0        8        1646.68
verisol      8        61         31           2        0        173.66
smt-checker  6        9          87           0        0        15.15
solc-verify  78       8          16           0        0        63.08

contracts/delete (14/14)
tool         correct  incorrect  unsupported  unknown  timeout  time
myth         13       1          0            0        0        46.83
verisol      3        8          3            0        0        24.15
smt-checker  0        0          14           0        0        0.34
solc-verify  7        1          6            0        0        8.83

contracts/init (18/18)
tool         correct  incorrect  unsupported  unknown  timeout  time
myth         15       3          0            0        0        59.17
verisol      7        8          3            0        0        28.36
smt-checker  0        0          18           0        0        0.44
solc-verify  13       5          0            0        0        11.54

contracts/storage (27/27)
tool         correct  incorrect  unsupported  unknown  timeout  time
myth         27       0          0            0        0        308.79
verisol      12       15         0            0        0        43.01
smt-checker  2        0          25           0        0        1.28
solc-verify  27       0          0            0        0        17.94

contracts/storageptr (164/164)
tool         correct  incorrect  unsupported  unknown  timeout  time
myth         164      0          0            0        0        1439.29
verisol      128      19         17           0        0        202.7
smt-checker  4        18         142          0        0        21.97
solc-verify  164      0          0            0        0        97.09
```

