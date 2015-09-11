# crystal-experiment-program-specialization

Experiment on program specialization in crystal.

Checking how crystal types can be composed in a performance way.

## Usage

```
$ crystal samples/benchmark.cr
    naive 744480.58 (± 16344.22)  1.24× slower
naive bit 681886.79 (± 5621.89)  1.35× slower
 generics 920048.98 (± 5709.43)       fastest

$ crystal run --release samples/benchmark.cr
     naive 1789511.78 (± 51076.50)  1.72× slower
 naive bit 2321173.08 (± 54024.54)  1.33× slower
  generics 3079745.11 (± 67180.52)       fastest

$ crystal --version
  Crystal 0.7.7 [170f859] (Sat Sep  5 02:46:31 UTC 2015)
```

## Contributors

- [bcardiff](https://github.com/bcardiff) Brian J. Cardiff - creator, maintainer

## References

- [UVU: Andrei Alexandrescu - DConf 2015](https://www.youtube.com/watch?v=mCrVYYlFTrA)
