# This is a fork of the original DuckDB-Swift repository, with the following changes:
# - The source is from the niente-internal/duckdb-swift repository
# - A podspec is added to allow the use of the framework with CocoaPods

Pod::Spec.new do |spec|
  spec.name         = "DuckDB-Swift"
  spec.version      = "1.0.0"
  spec.summary      = "DuckDB database engine for Swift."
  spec.description  = <<-DESC
                     DuckDB is a high-performance analytical database system. 
                     This package provides a native Swift API for DuckDB, designed to be fast, 
                     reliable and easy to use across Apple, Linux, and Windows platforms.
                     DESC
  spec.homepage     = "https://github.com/niente-internal/duckdb-swift"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "DuckDB Developers" => "info@duckdb.org" }
  spec.source       = { 
    :git => "https://github.com/niente-internal/duckdb-swift.git"
  }

  spec.swift_version = "5.5"
  spec.ios.deployment_target = "13.0"
  spec.osx.deployment_target = "10.15"
  
  # Preserve the original structure of DuckDB's include folder
  spec.preserve_paths = "Sources/Cduckdb/duckdb/src/include/**"
  
  # Dynamically include all headers inside 'include/**' instead of manually specifying subdirectories
  spec.public_header_files = "Sources/Cduckdb/duckdb/src/include/**/*.hpp"

  # Ensure headers retain their directory structure
  spec.header_mappings_dir = "Sources/Cduckdb/duckdb/src/include"

  # Fix header search paths to make sure nested headers are found
  spec.xcconfig = {
    'HEADER_SEARCH_PATHS' => '"${PODS_ROOT}/DuckDB-Swift/Sources/Cduckdb/duckdb/src/include/**"',
    'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES',
    'CLANG_CXX_LANGUAGE_STANDARD' => 'gnu++17',
    'CLANG_CXX_LIBRARY' => 'libc++',
    'OTHER_CPLUSPLUSFLAGS' => '-std=c++17 -stdlib=libc++',
    'GCC_INPUT_FILETYPE' => 'sourcecode.cpp.objcpp' # Ensure Objective-C++ compatibility
  }

  # Exclude unnecessary generated files to prevent conflicts
  spec.exclude_files = "Sources/Cduckdb/duckdb/src/include/duckdb/storage/compression/roaring/generated/**"

  # Source files
  spec.source_files = "Sources/**/*"

  # Vendored frameworks
  spec.vendored_frameworks = "Sources/duckdb_swift_native.xcframework"

  spec.requires_arc = true
  spec.frameworks   = "Foundation"
end