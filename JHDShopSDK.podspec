#
# Be sure to run `pod lib lint JHDShopSDK-iOS.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'JHDShopSDK'
  s.version          = '0.1.1'
  s.summary          = 'A short description of JHDShopSDK-iOS.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/shangling123/JHDShopSDK-iOS'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'qinhongjiang' => 'qinhongjiang@jd.com' }
  s.source           = { :git => 'https://github.com/shangling123/JHDShopSDK-iOS.git', :tag => s.version.to_s }
  

  s.ios.deployment_target = '9.0'
  s.frameworks = 'UIKit', 'MapKit'
  s.vendored_frameworks = 'JHDShopSDK/Lib/JHDShopSDK.framework'
  s.resource = 'JHDShopSDK/Lib/JHDShopSDK.bundle'
   

end
