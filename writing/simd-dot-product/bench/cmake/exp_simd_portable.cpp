// Copyright (c) 2026 Lorenzo Caprari
// SPDX-License-Identifier: Apache-2.0

#include "exp_simd_portable.hpp"

#include <eve/module/algo.hpp>
#include <eve/module/core.hpp>

#include <experimental/simd>

#include <cstddef>

#if defined(__aarch64__)
#include <arm_neon.h>
#endif

namespace nesso::exp
{
namespace
{

[[nodiscard]] float DotEve(std::span<const float> left, std::span<const float> right)
{
    return eve::algo::transform_reduce[eve::algo::fuse_operations](
        eve::algo::views::zip(left, right),
        [](auto pair, auto sum) { return eve::fma(get<0>(pair), get<1>(pair), sum); }, 0.0F);
}

[[nodiscard]] float DotStdSimd(std::span<const float> left, std::span<const float> right)
{
    using Simd = std::experimental::native_simd<float>;
    const std::size_t lanes = Simd::size();
    Simd accumulator{0.0F};
    std::size_t index = 0;
    for (; index + lanes <= left.size(); index += lanes)
    {
        const Simd left_chunk(left.data() + index, std::experimental::element_aligned);
        const Simd right_chunk(right.data() + index, std::experimental::element_aligned);
        accumulator += left_chunk * right_chunk;
    }
    float result = std::experimental::reduce(accumulator);
    for (; index < left.size(); ++index)
    {
        result += left[index] * right[index];
    }
    return result;
}

[[nodiscard]] float DotStdSimd4Acc(std::span<const float> left, std::span<const float> right)
{
    using Simd = std::experimental::native_simd<float>;
    const std::size_t lanes = Simd::size();
    const std::size_t stride = lanes * 4;
    Simd acc0{0.0F};
    Simd acc1{0.0F};
    Simd acc2{0.0F};
    Simd acc3{0.0F};
    std::size_t index = 0;
    for (; index + stride <= left.size(); index += stride)
    {
        const Simd left0(left.data() + index, std::experimental::element_aligned);
        const Simd right0(right.data() + index, std::experimental::element_aligned);
        const Simd left1(left.data() + index + lanes, std::experimental::element_aligned);
        const Simd right1(right.data() + index + lanes, std::experimental::element_aligned);
        const Simd left2(left.data() + index + (2 * lanes), std::experimental::element_aligned);
        const Simd right2(right.data() + index + (2 * lanes), std::experimental::element_aligned);
        const Simd left3(left.data() + index + (3 * lanes), std::experimental::element_aligned);
        const Simd right3(right.data() + index + (3 * lanes), std::experimental::element_aligned);
        acc0 = std::experimental::fma(left0, right0, acc0);
        acc1 = std::experimental::fma(left1, right1, acc1);
        acc2 = std::experimental::fma(left2, right2, acc2);
        acc3 = std::experimental::fma(left3, right3, acc3);
    }
    for (; index + lanes <= left.size(); index += lanes)
    {
        const Simd left_chunk(left.data() + index, std::experimental::element_aligned);
        const Simd right_chunk(right.data() + index, std::experimental::element_aligned);
        acc0 = std::experimental::fma(left_chunk, right_chunk, acc0);
    }
    float result = std::experimental::reduce(acc0) + std::experimental::reduce(acc1) +
                   std::experimental::reduce(acc2) + std::experimental::reduce(acc3);
    for (; index < left.size(); ++index)
    {
        result += left[index] * right[index];
    }
    return result;
}

#if defined(__aarch64__)
[[nodiscard]] float DotNeon4AccImpl(std::span<const float> left, std::span<const float> right)
{
    float32x4_t acc0 = vdupq_n_f32(0.0F);
    float32x4_t acc1 = vdupq_n_f32(0.0F);
    float32x4_t acc2 = vdupq_n_f32(0.0F);
    float32x4_t acc3 = vdupq_n_f32(0.0F);
    std::size_t index = 0;
    for (; index + 16 <= left.size(); index += 16)
    {
        acc0 = vfmaq_f32(acc0, vld1q_f32(left.data() + index), vld1q_f32(right.data() + index));
        acc1 = vfmaq_f32(acc1, vld1q_f32(left.data() + index + 4), vld1q_f32(right.data() + index + 4));
        acc2 = vfmaq_f32(acc2, vld1q_f32(left.data() + index + 8), vld1q_f32(right.data() + index + 8));
        acc3 = vfmaq_f32(acc3, vld1q_f32(left.data() + index + 12), vld1q_f32(right.data() + index + 12));
    }
    float result = vaddvq_f32(acc0) + vaddvq_f32(acc1) + vaddvq_f32(acc2) + vaddvq_f32(acc3);
    for (; index < left.size(); ++index)
    {
        result += left[index] * right[index];
    }
    return result;
}
#endif

} // namespace

#if defined(NESSO_EXP_AVX2_BUILD)

#if defined(__x86_64__)
float DotEveAvx2(std::span<const float> left, std::span<const float> right) { return DotEve(left, right); }

float DotStdSimdAvx2(std::span<const float> left, std::span<const float> right) { return DotStdSimd(left, right); }

float DotStdSimd4AccAvx2(std::span<const float> left, std::span<const float> right)
{
    return DotStdSimd4Acc(left, right);
}

int StdSimdLanesAvx2()
{
    return static_cast<int>(std::experimental::native_simd<float>::size());
}
#endif

#else

float DotEveBaseline(std::span<const float> left, std::span<const float> right) { return DotEve(left, right); }

float DotStdSimdBaseline(std::span<const float> left, std::span<const float> right)
{
    return DotStdSimd(left, right);
}

float DotStdSimd4AccBaseline(std::span<const float> left, std::span<const float> right)
{
    return DotStdSimd4Acc(left, right);
}

int StdSimdLanesBaseline()
{
    return static_cast<int>(std::experimental::native_simd<float>::size());
}

#if defined(__aarch64__)
float DotNeon4Acc(std::span<const float> left, std::span<const float> right)
{
    return DotNeon4AccImpl(left, right);
}
#endif

#endif

} // namespace nesso::exp
