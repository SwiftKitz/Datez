Pod::Spec.new do |s|

  s.name         = "Datez"
  s.version      = "2.0.0"
  s.summary      = "Breeze through NSDate, NSDateComponents, and NSTimeInterval!"
  s.description  = <<-DESC
                   A swift datez library that focuses on readability, compactness,
                   and maintainability. Get started with the docs or associated
                   playgrounds to quickly make the most out of this library.
                   DESC

  s.homepage     = "http://kitz.io"
  s.license      = "MIT"
  s.author             = { "Maz Jaleel" => "mazjaleel@gmail.com" }
  s.social_media_url   = "http://twitter.com/SwiftKitz"

  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.9"
  s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target = "9.0"

  s.source       = { :git => "https://github.com/SwiftKitz/Datez.git", :tag => "v2.0.0" }
  s.source_files = "Datez/Datez/**/*.swift"
end
