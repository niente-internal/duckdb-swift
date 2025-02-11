Pod::Spec.new do |spec|
  spec.name         = "DuckDB-Swift"
  spec.version      = "1.0.0"
  spec.summary      = "DuckDB database engine for Swift."
  spec.description  = <<-DESC
                     DuckDB is a high-performance analytical database system. 
                     This package provides a native Swift API for DuckDB, designed to be fast, 
                     reliable and easy to use across Apple, Linux and Windows platforms.
                     DESC
  spec.homepage     = "https://github.com/duckdb/duckdb-swift"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "DuckDB Developers" => "info@duckdb.org" }
  spec.source       = { 
    :git => "https://github.com/duckdb/duckdb-swift.git", 
    :tag => "v#{spec.version}" 
  }

  spec.swift_version = "5.5"
  spec.ios.deployment_target = "13.0"
  spec.osx.deployment_target = "10.15"
  
  spec.source_files = "Sources/**/*"
  spec.vendored_frameworks = "Sources/duckdb_swift_native.xcframework"
  spec.requires_arc = true
  spec.frameworks   = "Foundation"
end 