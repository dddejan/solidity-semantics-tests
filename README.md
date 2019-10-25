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
myth         94       0          0            0        8        1655.14
verisol      8        61         31           2        0        175.27
smt-checker  6        9          87           0        0        15.25
solc-verify  78       8          16           0        0        62.81

contracts/delete (14/14)
tool         correct  incorrect  unsupported  unknown  timeout  time
myth         13       1          0            0        0        47.51
verisol      3        8          3            0        0        24.66
smt-checker  0        0          14           0        0        0.3
solc-verify  7        1          6            0        0        9.02

contracts/init (18/18)
tool         correct  incorrect  unsupported  unknown  timeout  time
myth         15       3          0            0        0        59.67
verisol      7        8          3            0        0        28.82
smt-checker  0        0          18           0        0        0.41
solc-verify  13       5          0            0        0        11.88

contracts/storage (27/27)
tool         correct  incorrect  unsupported  unknown  timeout  time
myth         27       0          0            0        0        310.4
verisol      12       15         0            0        0        43.45
smt-checker  2        0          25           0        0        1.32
solc-verify  27       0          0            0        0        17.61

contracts/storageptr (164/164)
tool         correct  incorrect  unsupported  unknown  timeout  time
myth         164      0          0            0        0        1520.29
verisol      128      19         17           0        0        203.93
smt-checker  4        18         142          0        0        21.93
solc-verify  164      0          0            0        0        96.92
```

