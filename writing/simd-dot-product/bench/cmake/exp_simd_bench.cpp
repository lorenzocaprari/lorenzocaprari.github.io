// Copyright (c) 2026 Lorenzo Caprari
// SPDX-License-Identifier: Apache-2.0

#include "exp_simd_portable.hpp"

#include <core/distance.hpp>
#include <core/distance_kernels.hpp>

#include <benchmark/benchmark.h>

#include <cmath>
#include <cstdint>
#include <iostream>
#include <random>
#include <span>
#include <string>
#include <string_view>
#include <vector>

namespace
{

constexpr std::size_t kDimensions = 384;
constexpr std::size_t kCheckPairs = 1000;
constexpr std::uint32_t kCheckSeed = 20261118;
constexpr std::size_t kStreamVectors = 30960;
constexpr std::uint32_t kStreamSeed = 30960;
constexpr float kMaxAbsDiff = 1.0e-3F;

using DotFn = float (*)(std::span<const float>, std::span<const float>);

[[nodiscard]] std::vector<float> RandomVector(std::mt19937 &rng, std::size_t count)
{
    std::uniform_real_distribution<float> dist(-1.0F, 1.0F);
    std::vector<float> values(count);
    for (float &value : values)
    {
        value = dist(rng);
    }
    return values;
}

[[nodiscard]] float ScalarDot(std::span<const float> left, std::span<const float> right)
{
    float sum = 0.0F;
    for (std::size_t index = 0; index < left.size(); ++index)
    {
        sum += left[index] * right[index];
    }
    return sum;
}

[[nodiscard]] float ProductScalar(std::span<const float> left, std::span<const float> right)
{
    return nesso::core::math::detail::DotProductScalar<float>(left, right);
}

#if defined(__x86_64__)
[[nodiscard]] float ProductAvx2(std::span<const float> left, std::span<const float> right)
{
    return nesso::core::math::detail::DotProductAvx2Fma(left, right);
}
#endif

[[nodiscard]] float ScalarL2(std::span<const float> left, std::span<const float> right)
{
    float sum = 0.0F;
    for (std::size_t index = 0; index < left.size(); ++index)
    {
        const float delta = left[index] - right[index];
        sum += delta * delta;
    }
    return sum;
}

[[nodiscard]] float ProductL2Scalar(std::span<const float> left, std::span<const float> right)
{
    return nesso::core::math::detail::L2SquaredDistanceScalar<float>(left, right);
}

#if defined(__x86_64__)
[[nodiscard]] float ProductL2Avx2(std::span<const float> left, std::span<const float> right)
{
    return nesso::core::math::detail::L2SquaredDistanceAvx2Fma(left, right);
}
#endif

struct CheckRow
{
    const char *name;
    DotFn function;
};

[[nodiscard]] int RunCheck()
{
    const CheckRow rows[] = {
        {"eve-baseline", nesso::exp::DotEveBaseline},
        {"stdsimd-baseline", nesso::exp::DotStdSimdBaseline},
        {"stdsimd-4acc-baseline", nesso::exp::DotStdSimd4AccBaseline},
        {"product-scalar", ProductScalar},
#if defined(__x86_64__)
        {"eve-avx2", nesso::exp::DotEveAvx2},
        {"stdsimd-avx2", nesso::exp::DotStdSimdAvx2},
        {"stdsimd-4acc-avx2", nesso::exp::DotStdSimd4AccAvx2},
        {"product-avx2", ProductAvx2},
#endif
#if defined(__aarch64__)
        {"neon-4acc", nesso::exp::DotNeon4Acc},
#endif
    };

#if defined(__x86_64__)
    const CheckRow l2_rows[] = {
        {"l2-scalar", ProductL2Scalar},
        {"l2-avx2", ProductL2Avx2},
    };
#else
    const CheckRow l2_rows[] = {
        {"l2-scalar", ProductL2Scalar},
    };
#endif

    float max_by_row[std::size(rows)] = {};
    float max_l2[std::size(l2_rows)] = {};
    std::mt19937 rng{kCheckSeed};
    for (std::size_t pair = 0; pair < kCheckPairs; ++pair)
    {
        const std::vector<float> left = RandomVector(rng, kDimensions);
        const std::vector<float> right = RandomVector(rng, kDimensions);
        const float reference = ScalarDot(left, right);
        for (std::size_t row = 0; row < std::size(rows); ++row)
        {
            const float diff = std::fabs(rows[row].function(left, right) - reference);
            if (diff > max_by_row[row])
            {
                max_by_row[row] = diff;
            }
        }
        const float l2_reference = ScalarL2(left, right);
        for (std::size_t row = 0; row < std::size(l2_rows); ++row)
        {
            const float diff = std::fabs(l2_rows[row].function(left, right) - l2_reference);
            if (diff > max_l2[row])
            {
                max_l2[row] = diff;
            }
        }
    }

    std::cout << "eve_tag=" << nesso::exp::kEveTag << '\n';
    std::cout << "eve_style=" << nesso::exp::kEveStyle << '\n';
    std::cout << "stdsimd_header=" << nesso::exp::kStdSimdHeader << '\n';
    std::cout << "stdsimd_style=" << nesso::exp::kStdSimdStyle << '\n';
    std::cout << "stdsimd_4acc_style=" << nesso::exp::kStdSimd4AccStyle << '\n';
#if defined(__aarch64__)
    std::cout << "neon_4acc_style=" << nesso::exp::kNeon4AccStyle << '\n';
#endif
    std::cout << "stdsimd_lanes_baseline=" << nesso::exp::StdSimdLanesBaseline() << '\n';
#if defined(__x86_64__)
    std::cout << "stdsimd_lanes_avx2=" << nesso::exp::StdSimdLanesAvx2() << '\n';
#endif
    std::cout << "check_seed=" << kCheckSeed << " pairs=" << kCheckPairs << " limit=" << kMaxAbsDiff << '\n';

    bool failed = false;
    for (std::size_t row = 0; row < std::size(rows); ++row)
    {
        const bool row_failed = max_by_row[row] > kMaxAbsDiff;
        failed = failed || row_failed;
        std::cout << "CHECK " << rows[row].name << " max_abs=" << max_by_row[row]
                  << (row_failed ? " FAIL" : " PASS") << '\n';
    }
    for (std::size_t row = 0; row < std::size(l2_rows); ++row)
    {
        const bool row_failed = max_l2[row] > kMaxAbsDiff;
        failed = failed || row_failed;
        std::cout << "CHECK " << l2_rows[row].name << " max_abs=" << max_l2[row]
                  << (row_failed ? " FAIL" : " PASS") << '\n';
    }
    return failed ? 1 : 0;
}

void TimeDot(benchmark::State &state, DotFn function)
{
    std::mt19937 rng{1};
    const std::vector<float> left = RandomVector(rng, kDimensions);
    const std::vector<float> right = RandomVector(rng, kDimensions);
    for (auto _ : state)
    {
        float score = function(left, right);
        benchmark::DoNotOptimize(score);
        benchmark::ClobberMemory();
    }
}

void TimeStream(benchmark::State &state, DotFn function)
{
    std::mt19937 rng{kStreamSeed};
    const std::vector<float> matrix = RandomVector(rng, kStreamVectors * kDimensions);
    const std::vector<float> query = RandomVector(rng, kDimensions);
    for (auto _ : state)
    {
        float sum = 0.0F;
        for (std::size_t row = 0; row < kStreamVectors; ++row)
        {
            const std::span<const float> vector(matrix.data() + (row * kDimensions), kDimensions);
            float score = function(vector, query);
            benchmark::DoNotOptimize(score);
            sum += score;
        }
        benchmark::DoNotOptimize(sum);
        benchmark::ClobberMemory();
    }
    state.SetItemsProcessed(state.iterations() * static_cast<std::int64_t>(kStreamVectors));
}

void DotProduct384Scalar(benchmark::State &state) { TimeDot(state, ProductScalar); }
void L2Squared384Scalar(benchmark::State &state) { TimeDot(state, ProductL2Scalar); }
#if defined(__x86_64__)
void DotProduct384Avx2(benchmark::State &state) { TimeDot(state, ProductAvx2); }
void L2Squared384Avx2(benchmark::State &state) { TimeDot(state, ProductL2Avx2); }
#endif
void DotProduct384EveBaseline(benchmark::State &state) { TimeDot(state, nesso::exp::DotEveBaseline); }
void DotProduct384StdSimdBaseline(benchmark::State &state) { TimeDot(state, nesso::exp::DotStdSimdBaseline); }
void DotProduct384StdSimd4AccBaseline(benchmark::State &state)
{
    TimeDot(state, nesso::exp::DotStdSimd4AccBaseline);
}
#if defined(__aarch64__)
void DotProduct384Neon4Acc(benchmark::State &state) { TimeDot(state, nesso::exp::DotNeon4Acc); }
#endif
void StreamDot384Scalar(benchmark::State &state) { TimeStream(state, ProductScalar); }
void StreamDot384EveBaseline(benchmark::State &state) { TimeStream(state, nesso::exp::DotEveBaseline); }
void StreamDot384StdSimdBaseline(benchmark::State &state) { TimeStream(state, nesso::exp::DotStdSimdBaseline); }
void StreamDot384StdSimd4AccBaseline(benchmark::State &state)
{
    TimeStream(state, nesso::exp::DotStdSimd4AccBaseline);
}
#if defined(__aarch64__)
void StreamDot384Neon4Acc(benchmark::State &state) { TimeStream(state, nesso::exp::DotNeon4Acc); }
#endif
void StreamL2Squared384Scalar(benchmark::State &state) { TimeStream(state, ProductL2Scalar); }
#if defined(__x86_64__)
void DotProduct384EveAvx2(benchmark::State &state) { TimeDot(state, nesso::exp::DotEveAvx2); }
void DotProduct384StdSimdAvx2(benchmark::State &state) { TimeDot(state, nesso::exp::DotStdSimdAvx2); }
void DotProduct384StdSimd4AccAvx2(benchmark::State &state) { TimeDot(state, nesso::exp::DotStdSimd4AccAvx2); }
void StreamDot384Avx2(benchmark::State &state) { TimeStream(state, ProductAvx2); }
void StreamDot384EveAvx2(benchmark::State &state) { TimeStream(state, nesso::exp::DotEveAvx2); }
void StreamDot384StdSimdAvx2(benchmark::State &state) { TimeStream(state, nesso::exp::DotStdSimdAvx2); }
void StreamDot384StdSimd4AccAvx2(benchmark::State &state) { TimeStream(state, nesso::exp::DotStdSimd4AccAvx2); }
void StreamL2Squared384Avx2(benchmark::State &state) { TimeStream(state, ProductL2Avx2); }
#endif

} // namespace

BENCHMARK(DotProduct384Scalar);
BENCHMARK(L2Squared384Scalar);
#if defined(__x86_64__)
BENCHMARK(DotProduct384Avx2);
BENCHMARK(L2Squared384Avx2);
#endif
BENCHMARK(DotProduct384EveBaseline);
BENCHMARK(DotProduct384StdSimdBaseline);
BENCHMARK(DotProduct384StdSimd4AccBaseline);
#if defined(__aarch64__)
BENCHMARK(DotProduct384Neon4Acc);
#endif
BENCHMARK(StreamDot384Scalar);
BENCHMARK(StreamDot384EveBaseline);
BENCHMARK(StreamDot384StdSimdBaseline);
BENCHMARK(StreamDot384StdSimd4AccBaseline);
#if defined(__aarch64__)
BENCHMARK(StreamDot384Neon4Acc);
#endif
BENCHMARK(StreamL2Squared384Scalar);
#if defined(__x86_64__)
BENCHMARK(DotProduct384EveAvx2);
BENCHMARK(DotProduct384StdSimdAvx2);
BENCHMARK(DotProduct384StdSimd4AccAvx2);
BENCHMARK(StreamDot384Avx2);
BENCHMARK(StreamDot384EveAvx2);
BENCHMARK(StreamDot384StdSimdAvx2);
BENCHMARK(StreamDot384StdSimd4AccAvx2);
BENCHMARK(StreamL2Squared384Avx2);
#endif

int main(int argc, char **argv)
{
    bool check_only = false;
    std::vector<char *> forwarded;
    forwarded.reserve(static_cast<std::size_t>(argc));
    forwarded.push_back(argv[0]);
    for (int index = 1; index < argc; ++index)
    {
        if (std::string_view{argv[index]} == "--check")
        {
            check_only = true;
            continue;
        }
        forwarded.push_back(argv[index]);
    }

    const int check = RunCheck();
    if (check_only || check != 0)
    {
        return check;
    }

    int forwarded_argc = static_cast<int>(forwarded.size());
    benchmark::Initialize(&forwarded_argc, forwarded.data());
    benchmark::RunSpecifiedBenchmarks();
    benchmark::Shutdown();
    return 0;
}
