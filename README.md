This is a silly toy thing and in no way form is the "correct" or right method, it was just to explore lazyness with diff sized maps

```mix run bench.exs
Compiling 1 file (.ex)
Operating System: Linux
CPU Information: Intel(R) Core(TM) i7-7700HQ CPU @ 2.80GHz
Number of Available Cores: 8
Available memory: 15.85 GB
Elixir 1.7.4
Erlang 22.3

Benchmark suite executing with the following configuration:
warmup: 2 s
time: 10 s
memory time: 2 s
parallel: 1
inputs: large, medium, small, supersize
Estimated total run time: 1.87 min

Benchmarking Lachlan with input large...
Benchmarking Lachlan with input medium...
Benchmarking Lachlan with input small...
Benchmarking Lachlan with input supersize...
Benchmarking Mat with input large...
Benchmarking Mat with input medium...
Benchmarking Mat with input small...
Benchmarking Mat with input supersize...
```
---

```
##### With input large #####
Name              ips        average  deviation         median         99th %
Mat          158.29 K        6.32 μs   ±558.38%        4.90 μs       24.70 μs
Lachlan       83.78 K       11.94 μs   ±324.17%           9 μs          62 μs

Comparison:
Mat          158.29 K
Lachlan       83.78 K - 1.89x slower +5.62 μs

Memory usage statistics:

Name       Memory usage
Mat             4.33 KB
Lachlan        10.11 KB - 2.34x memory usage +5.78 KB

**All measurements for memory usage were the same**

##### With input medium #####
Name              ips        average  deviation         median         99th %
Mat          152.90 K        6.54 μs   ±620.47%           5 μs       25.80 μs
Lachlan       72.84 K       13.73 μs   ±334.93%        9.20 μs       74.20 μs

Comparison:
Mat          152.90 K
Lachlan       72.84 K - 2.10x slower +7.19 μs

Memory usage statistics:

Name       Memory usage
Mat             4.33 KB
Lachlan        10.11 KB - 2.34x memory usage +5.78 KB

**All measurements for memory usage were the same**

##### With input small #####
Name              ips        average  deviation         median         99th %
Mat          157.76 K        6.34 μs   ±672.20%        4.90 μs          25 μs
Lachlan       80.83 K       12.37 μs   ±340.93%           9 μs          68 μs

Comparison:
Mat          157.76 K
Lachlan       80.83 K - 1.95x slower +6.03 μs

Memory usage statistics:

Name       Memory usage
Mat             4.33 KB
Lachlan        10.11 KB - 2.34x memory usage +5.78 KB

**All measurements for memory usage were the same**

##### With input supersize #####
Name              ips        average  deviation         median         99th %
Mat          145.00 K        6.90 μs   ±636.95%        5.10 μs       27.10 μs
Lachlan       76.28 K       13.11 μs   ±307.59%        9.20 μs       70.90 μs

Comparison:
Mat          145.00 K
Lachlan       76.28 K - 1.90x slower +6.21 μs

Memory usage statistics:

Name       Memory usage
Mat             4.33 KB
Lachlan        10.11 KB - 2.34x memory usage +5.78 KB

**All measurements for memory usage were the same**
```
