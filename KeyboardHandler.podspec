Pod::Spec.new do |s|
  s.name         = "KeyboardHandler"
  s.version      = "0.1.0"
  s.summary      = "A small library that helps you manage the iOS keyboard in a much simpler way"
  s.homepage     = "https://github.com/dolfn/KeyboardHandler"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Dolfn" => "tap@dolfn.com" }
  s.social_media_url   = "https://twitter.com/dolfn_apps"
  s.ios.deployment_target = "8.0"
  s.source       = { :git => "https://github.com/dolfn/KeyboardHandler.git", :tag => s.version.to_s }
  s.source_files  = "Sources/**/*"
  s.frameworks  = "Foundation", "UIKit"
  s.requires_arc = true
  s.module_name = "KeyboardHandler"
end
