

Pod::Spec.new do |spec|

  spec.name         = "FinalTest"
  spec.version      = "0.0.1"
  spec.summary      = "final test for the spec."

  spec.description  = <<-DESC
                    the final test must be successful
                   DESC

  spec.homepage     = "https://github.com/15142329586/FinalTest"
  spec.license      = "MIT"
  spec.license      = { :type => "MIT", :file => "LICENSE" }


  spec.author             = { "mingyue" => "15142329586@163.com" }
  spec.platform     = :ios, "9.0"

  spec.source       = { :git => "https://github.com/15142329586/FinalTest.git", :tag => spec.version }

  spec.source_files  = "AlertView/*.{h,m}"

  # spec.framework  = "SomeFramework"
  # spec.frameworks = "SomeFramework", "AnotherFramework"

  # spec.library   = "iconv"
  # spec.libraries = "iconv", "xml2"

  spec.requires_arc = true

  # spec.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # spec.dependency "JSONKit", "~> 1.4"

end
