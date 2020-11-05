#
# Be sure to run `pod lib lint ReadDiceKey.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ReadDiceKey'
  s.version          = '0.1.0'
  s.summary          = 'A short description of ReadDiceKey.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/dicekeys/read-dicekey-ios'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'Copyright', :file => 'LICENSE.md' }
  s.author           = { 'Nikita Titov' => 'nmtitov@ya.ru' }
  s.source           = { :git => 'https://github.com/dicekeys/read-dicekey-ios.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files =
      'ReadDiceKey/Classes/**/*',
      'deps/read-dicekey/includes/**/*',
      'deps/read-dicekey/lib-dicekey/**/*.{h,hpp,cpp}',
      'deps/read-dicekey/lib-read-dicekey/**/*.{h,hpp,cpp}'

  
  # s.resource_bundles = {
  #   'ReadDiceKey' => ['ReadDiceKey/Assets/*.png']
  # }

  s.public_header_files = 'ReadDiceKey/Classes/generated_src/objc/DKImageProcessor.h'

  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'

  s.dependency "OpenCV2", '~> 4.3.0'
  s.dependency 'Djinni', '~> 4.4.1'
  s.static_framework = true
end
