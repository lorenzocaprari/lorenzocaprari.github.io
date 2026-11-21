// Copyright (c) 2026 Lorenzo Caprari
// SPDX-License-Identifier: Apache-2.0

#ifndef BENCH_EXP_SIMD_PORTABLE_HPP
#define BENCH_EXP_SIMD_PORTABLE_HPP

#include <span>

namespace nesso::exp
{

inline constexpr const char *kEveTag = "v2023.02.15";
inline constexpr const char *kEveStyle =
    "eve::algo::transform_reduce[eve::algo::fuse_operations] over eve::algo::views::zip; map is eve::fma";
inline constexpr const char *kStdSimdHeader = "<experimental/simd>";
inline constexpr const char *kStdSimdStyle =
    "std::experimental::native_simd<float>, one accumulator, operator*, one reduce at the end";
inline constexpr const char *kStdSimd4AccStyle =
    "std::experimental::native_simd<float>, four accumulators, std::experimental::fma, one reduction after the loop";
#if defined(__aarch64__)
inline constexpr const char *kNeon4AccStyle =
    "float32x4_t, four accumulators, vfmaq_f32, vaddvq_f32 at the end";
#endif

[[nodiscard]] float DotEveBaseline(std::span<const float> left, std::span<const float> right);
[[nodiscard]] float DotStdSimdBaseline(std::span<const float> left, std::span<const float> right);
[[nodiscard]] float DotStdSimd4AccBaseline(std::span<const float> left, std::span<const float> right);
[[nodiscard]] int StdSimdLanesBaseline();
#if defined(__x86_64__)
[[nodiscard]] float DotEveAvx2(std::span<const float> left, std::span<const float> right);
[[nodiscard]] float DotStdSimdAvx2(std::span<const float> left, std::span<const float> right);
[[nodiscard]] float DotStdSimd4AccAvx2(std::span<const float> left, std::span<const float> right);
[[nodiscard]] int StdSimdLanesAvx2();
#endif
#if defined(__aarch64__)
[[nodiscard]] float DotNeon4Acc(std::span<const float> left, std::span<const float> right);
#endif

} // namespace nesso::exp

#endif // BENCH_EXP_SIMD_PORTABLE_HPP
