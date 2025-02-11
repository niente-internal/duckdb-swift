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
    :git => "https://github.com/duckdbniente-internal/duckdb-swift.git", 
    :tag => "v#{spec.version}" 
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

  # Source files
  spec.source_files = "Sources/**/*"

  # Vendored frameworks
  spec.vendored_frameworks = "Sources/duckdb_swift_native.xcframework"

  spec.requires_arc = true
  spec.frameworks   = "Foundation"
end