// swift-tools-version: 5.10
import PackageDescription

let package = Package(
  name: "MetaPtex",
  platforms: [
    .macOS(.v14),
    .visionOS(.v1),
    .iOS(.v17),
    .tvOS(.v17),
    .watchOS(.v10),
  ],
  products: [
    .library(
      name: "Ptex",
      type: .dynamic,
      targets: ["Ptex"]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/the-swift-collective/zlib", from: "1.3.1"),
  ],
  targets: [
    .target(
      name: "Ptex",
      dependencies: [
        .product(name: "ZLib", package: "zlib"),
      ],
      publicHeadersPath: "include",
      cxxSettings: [
        .define("_ALLOW_COMPILER_AND_STL_VERSION_MISMATCH", .when(platforms: [.windows])),
        .define("_ALLOW_KEYWORD_MACROS", to: "1", .when(platforms: [.windows])),
        .define("static_assert(_conditional, ...)", to: "", .when(platforms: [.windows])),
        .define("PTEX_EXPORTS", to: "1"),
        .define("PTEX_PLATFORM_WINDOWS", .when(platforms: [.windows])),
      ]
    ),
  ],
  cLanguageStandard: .gnu17,
  cxxLanguageStandard: .cxx17
)
