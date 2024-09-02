// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "AbseilCXX17",
  products: [
    .library(name: "AbseilCXX17", targets: ["AbseilCXX17"]),
  ],

  targets: [
    .target(
      name: "AbseilCXX17",
      path: ".",
      exclude: [
        // main functions
        "absl/hash/internal/print_hash_of.cc",
        "absl/random/internal/gaussian_distribution_gentables.cc",
        "absl/random/internal/randen_benchmarks.cc",
        // tests
        "absl/log/scoped_mock_log.cc",
        "absl/log/internal/test_helpers.cc",
        "absl/log/internal/test_matchers.cc",
        "absl/base/spinlock_test_common.cc",
        "absl/base/internal/exception_safety_testing.cc",
        "absl/random/benchmarks.cc",
      ],
      sources: [
        "absl/"
      ],
      publicHeadersPath: ".",
      cSettings: [
        .headerSearchPath("./"),
      ],
      linkerSettings: [
        .linkedFramework("CoreFoundation"),
      ]
    ),
    .testTarget(
      name: "build-test",
      dependencies: [
        "AbseilCXX17",
      ],
      path: "SwiftPMTests/build-test"
    ),
  ],

  cxxLanguageStandard: CXXLanguageStandard.cxx1z
)

