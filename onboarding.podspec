#
# Be sure to run `pod lib lint onboarding.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
s.name             = 'onboarding'
s.version          = '0.1.5'
s.summary          = 'Displaying an onboarding screens'
s.description      = 'Showing an onboarding screens when first time users enter into your Application. Primarily, This will show off your Applicaton Flow'
s.homepage         = 'https://github.com/f22labs/onboard-ios'
# s.screenshots    = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
s.license          = 'MIT'
s.author           = { 'ranjith' => 'ranjith@f22labs.com' }
s.source           = { :git => 'https://github.com/f22labs/onboard-ios.git', :tag => s.version.to_s }
s.social_media_url = 'https://twitter.com/f22labs'
s.requires_arc     = true
s.ios.deployment_target = '8.1'
s.source_files = 'onboarding/Classes/**/*'
# s.resource_bundles = {
#   'onboarding' => ['onboarding/Assets/*.png']
# }

# s.public_header_files = 'Pod/Classes/**/*.h'
# s.frameworks = 'UIKit', 'MapKit'
end
