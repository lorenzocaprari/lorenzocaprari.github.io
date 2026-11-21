find_package(benchmark CONFIG REQUIRED)

add_executable(nesso_bench nesso_bench.cpp)
target_link_libraries(nesso_bench PRIVATE nesso_options nesso_core
                                          nesso_tokenizer benchmark::benchmark)
target_compile_definitions(
  nesso_bench
  PRIVATE NESSO_BENCH_VOCAB="${CMAKE_SOURCE_DIR}/test/fixtures/tiny_vocab.txt")

include(FetchContent)
# Populate only. EVE is header-only here; its project() defaults build tests.
if(POLICY CMP0169)
  cmake_policy(SET CMP0169 OLD)
endif()
FetchContent_Declare(
  eve
  GIT_REPOSITORY https://github.com/jfalcou/eve.git
  GIT_TAG v2023.02.15
  GIT_SHALLOW TRUE)
FetchContent_GetProperties(eve)
if(NOT eve_POPULATED)
  FetchContent_Populate(eve)
endif()

function(nesso_exp_simd_tu target avx2)
  add_library(${target} OBJECT exp_simd_portable.cpp)
  target_link_libraries(${target} PRIVATE nesso_options)
  target_include_directories(${target} SYSTEM PRIVATE "${eve_SOURCE_DIR}/include")
  target_include_directories(${target} PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}")
  if(avx2)
    target_compile_definitions(${target} PRIVATE NESSO_EXP_AVX2_BUILD=1)
    target_compile_options(${target} PRIVATE -mavx2 -mfma)
  endif()
endfunction()

nesso_exp_simd_tu(exp_simd_portable_v2 OFF)
set(EXP_SIMD_OBJECTS exp_simd_portable_v2)
if(CMAKE_SYSTEM_PROCESSOR MATCHES "x86_64|AMD64")
  nesso_exp_simd_tu(exp_simd_portable_avx2 ON)
  list(APPEND EXP_SIMD_OBJECTS exp_simd_portable_avx2)
endif()

add_executable(exp_simd_bench exp_simd_bench.cpp)
target_link_libraries(exp_simd_bench PRIVATE nesso_options nesso_core
                                             benchmark::benchmark ${EXP_SIMD_OBJECTS})
target_include_directories(exp_simd_bench PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}")
