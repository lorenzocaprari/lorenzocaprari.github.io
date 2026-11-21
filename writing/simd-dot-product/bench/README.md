# Benchmark sources for "What SIMD buys a 384-float dot product"

Apache-2.0, like nesso. The benchmark builds against the distance kernels of
[nesso v0.3.0](https://github.com/lorenzocaprari/nesso/tree/v0.3.0) and adds the
portable kernels (EVE, `<experimental/simd>`, C++26 `<simd>`) next to them.

- `cmake/`: the benchmark as it ran for the main x86 tables and the ARM table.
  `exp_simd_bench.cpp`, `exp_simd_portable.cpp`, `exp_simd_portable.hpp` and
  `CMakeLists.txt` replace the files of the same name in nesso's `bench/`.
  The x86 tables were built from these files before the `__x86_64__` guards for
  aarch64 were added; the guards change nothing on x86.
  `exp-simd-arm.yml` is the GitHub Actions workflow that produced the ARM numbers.
- `gcc16/`: the GCC 15.2 against GCC 16.2 session, built in Ubuntu containers
  without Conan. `exp_simd_cxx26.cpp` holds the C++26 `<simd>` kernels, and this
  `exp_simd_bench.cpp` adds them to the benchmark.

## GCC 15.2 and GCC 16.2 in containers (x86-64, Docker)

```
git clone --depth 1 --branch v0.3.0 https://github.com/lorenzocaprari/nesso.git
cp cmake/exp_simd_portable.cpp cmake/exp_simd_portable.hpp nesso/bench/
cp gcc16/exp_simd_bench.cpp gcc16/exp_simd_cxx26.cpp nesso/bench/
docker run --rm -v "$PWD":/w ubuntu:26.04 /w/gcc16/build.sh g++-15 /w/out15
docker run --rm -v "$PWD":/w ubuntu:26.10 /w/gcc16/build.sh g++-16 /w/out16 cxx26
./gcc16/run.sh 2 2        # two alternating rounds, pinned to logical CPU 2
```

Each build ends with the correctness check: 1,000 random vector pairs against
the plain loop, limit 1e-3. Results land in `out15/run*.json` and
`out16/run*.json`; streamed rows are one pass over 30,960 vectors, so divide
`real_time` by 30,960 for nanoseconds per vector. The g++ 16 build also writes
the assembly of the C++26 kernels (`cxx26-*.s`).

## Inside a nesso checkout (CMake and Conan)

```
cp cmake/* nesso/bench/        # the .yml goes to .github/workflows/ if you want the ARM job
cd nesso
conan install . -pr:h ./conan/profiles/gcc-26-dev -pr:b default --lockfile=conan.lock --build=missing
conan build . -pr:h ./conan/profiles/gcc-26-dev -pr:b default --lockfile=conan.lock --build=missing
taskset -c 2 build/Release/bench/exp_simd_bench \
  --benchmark_repetitions=10 --benchmark_enable_random_interleaving=true
```

On arm64 use `conan/profiles/gcc-26-armv8`. EVE is fetched by CMake at tag
v2023.02.15. The ONNX Runtime 1.18.1 source archive that v0.3.0's dependencies
need has been missing upstream since November 2026; nesso's
[building notes](https://github.com/lorenzocaprari/nesso/blob/main/docs/building.md)
describe the Conan backup-source setting that fetches a byte-identical copy.

## Whole searches with the release binary

`search/measure.py` times whole `nesso search` runs of the official 0.3.0
package with `NESSO_TRACE=1`: three warm-up and ten timed runs per kernel,
alternating, one thread, pinned to logical CPU 2. `search/results.json` holds
every run behind the article's stage table.

```
gh release download v0.3.0 -R lorenzocaprari/nesso -p 'nesso_0.3.0_amd64.deb'
dpkg-deb -x nesso_0.3.0_amd64.deb deb
deb/usr/bin/nesso index --quiet -o hdfs-1m.nesso HDFS_1m.log --model-dir deb/usr/share/nesso
deb/usr/bin/nesso index --quiet -o bgl-100k.nesso BGL_100k.log --model-dir deb/usr/share/nesso
cp search/measure.py . && python3 measure.py
```

`HDFS_1m.log` and `BGL_100k.log` are the first 1,000,000 and 100,000 lines of
HDFS and BGL from [Loghub 2.0](https://doi.org/10.5281/zenodo.8275861).

## Clock check

`clock/clk.c` times a chain of 10^9 dependent integer `add`s, one cycle each on
Zen 5, and prints the effective clock in GHz. WSL2 exposes no clock or core-type
information, so this is how the article's 4.9 GHz figure was measured:
`gcc -O2 -o clk clock/clk.c && taskset -c 2 ./clk`.
