# Copyright (c) 2026 Lorenzo Caprari
# SPDX-License-Identifier: Apache-2.0
# Per-stage timing of whole nesso 0.3.0 searches (NESSO_TRACE=1), both kernels.
# Run next to an extracted nesso_0.3.0_amd64.deb (deb/) and the two indexes; see ../README.md.
import json, os, subprocess, time, statistics, sys
os.chdir(os.path.dirname(os.path.abspath(__file__)))
BIN = "deb/usr/bin/nesso"; M = "deb/usr/share/nesso"
CASES = [("hdfs-1m", "Got exception while serving block"), ("bgl-100k", "instruction cache parity error")]
MODES = ["auto", "dense"]; KERNELS = ["scalar", "avx2"]; WARM, RUNS = 3, 10
def run(corpus, query, mode, kernel):
    env = dict(os.environ, NESSO_TRACE="1", NESSO_THREADS="1", NESSO_FORCE_KERNEL=kernel)
    cmd = ["taskset", "-c", "2", BIN, "search", query, "-i", f"{corpus}.nesso", "--threads", "1", "--mode", mode, "--model-dir", M]
    t = time.perf_counter(); p = subprocess.run(cmd, env=env, capture_output=True, text=True); wall = time.perf_counter() - t
    assert p.returncode == 0, p.stderr
    tr = json.loads([l for l in p.stderr.splitlines() if l.startswith("{")][-1])
    return {"wall_s": wall, "rss": tr["peakRssBytes"], **{s["name"]: s["us"] for s in tr["stages"]}, "out": p.stdout}
res = []
for corpus, query in CASES:
    for mode in MODES:
        for i in range(WARM): [run(corpus, query, mode, k) for k in KERNELS]
        for i in range(RUNS):
            for k in (KERNELS if i % 2 == 0 else KERNELS[::-1]):
                r = run(corpus, query, mode, k); r.update(corpus=corpus, mode=mode, kernel=k, i=i); res.append(r)
        outs = {k: {r["out"] for r in res if r["corpus"] == corpus and r["mode"] == mode and r["kernel"] == k} for k in KERNELS}
        print(corpus, mode, "outputs per kernel:", {k: len(v) for k, v in outs.items()}, "same across kernels:", outs["scalar"] == outs["avx2"], flush=True)
json.dump([{k: v for k, v in r.items() if k != "out"} for r in res], open("e2e.json", "w"), indent=1)
print("done", time.strftime("%H:%M:%S"))
