Pod::Spec.new do |s|

  s.name         = "Datez"
  s.version      = "3.1.1"
  s.summary      = "Breeze through NSDate, NSDateComponents, and NSTimeInterval!"
  s.description  = <<-DESC
                   A swift datez library that focuses on readability, compactness,
                   and maintainability. Get started with the docs or associated
                   playgrounds to quickly make the most out of this library.
                   DESC

  s.homepage     = "https://swiftkitz.github.io"
  s.license      = "MIT"
  s.author             = { "Maz Jaleel" => "mazjaleel@gmail.com" }
  s.social_media_url   = "http://twitter.com/SwiftKitz"

  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.10"
  s.watchos.deployment_target = "3.0"
  s.tvos.deployment_target = "9.0"

  s.source       = { :git => "https://github.com/SwiftKitz/Datez.git", :tag => "v3.1.1" }
  s.source_files = "Datez/Datez/**/*.swift"
end
