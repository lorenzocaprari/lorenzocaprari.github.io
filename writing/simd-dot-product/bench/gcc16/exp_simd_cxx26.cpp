// Copyright (c) 2026 Lorenzo Caprari
// SPDX-License-Identifier: Apache-2.0
//
// C++26 <simd> (P1928) versions of the article kernels. GCC 16 libstdc++ only.
#include <simd>
#include <cstddef>
#include <span>

#ifndef __glibcxx_simd
#error "this libstdc++ does not enable <simd>"
#endif

namespace
{
using Vec = std::simd::vec<float>;

[[nodiscard]] Vec Load(const float *ptr) { return std::simd::unchecked_load<Vec>(ptr, Vec::size()); }

[[nodiscard]] float Dot1(std::span<const float> left, std::span<const float> right)
{
    constexpr std::size_t lanes = Vec::size();
    Vec acc{};
    std::size_t index = 0;
    for (; index + lanes <= left.size(); index += lanes)
    {
        acc += Load(left.data() + index) * Load(right.data() + index);
    }
    float result = std::simd::reduce(acc);
    for (; index < left.size(); ++index)
    {
        result += left[index] * right[index];
    }
    return result;
}

// libstdc++ 16 has no std::simd::fma, so the product and the sum are written
// separately and fusing is left to the compiler (-ffp-contract).
[[nodiscard]] float Dot4(std::span<const float> left, std::span<const float> right)
{
    constexpr std::size_t lanes = Vec::size();
    constexpr std::size_t stride = lanes * 4;
    Vec acc0{};
    Vec acc1{};
    Vec acc2{};
    Vec acc3{};
    std::size_t index = 0;
    for (; index + stride <= left.size(); index += stride)
    {
        acc0 += Load(left.data() + index) * Load(right.data() + index);
        acc1 += Load(left.data() + index + lanes) * Load(right.data() + index + lanes);
        acc2 += Load(left.data() + index + (2 * lanes)) * Load(right.data() + index + (2 * lanes));
        acc3 += Load(left.data() + index + (3 * lanes)) * Load(right.data() + index + (3 * lanes));
    }
    for (; index + lanes <= left.size(); index += lanes)
    {
        acc0 += Load(left.data() + index) * Load(right.data() + index);
    }
    float result = std::simd::reduce((acc0 + acc1) + (acc2 + acc3));
    for (; index < left.size(); ++index)
    {
        result += left[index] * right[index];
    }
    return result;
}
} // namespace

namespace nesso::exp
{
#if defined(NESSO_EXP_AVX2_BUILD)
float DotCxx26Simd1Avx2(std::span<const float> l, std::span<const float> r) { return Dot1(l, r); }
float DotCxx26Simd4Avx2(std::span<const float> l, std::span<const float> r) { return Dot4(l, r); }
int Cxx26LanesAvx2() { return static_cast<int>(Vec::size()); }
#else
float DotCxx26Simd1Baseline(std::span<const float> l, std::span<const float> r) { return Dot1(l, r); }
float DotCxx26Simd4Baseline(std::span<const float> l, std::span<const float> r) { return Dot4(l, r); }
int Cxx26LanesBaseline() { return static_cast<int>(Vec::size()); }
#endif
} // namespace nesso::exp
