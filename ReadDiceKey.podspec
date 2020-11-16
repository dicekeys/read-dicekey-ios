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
  s.summary          = 'iOS library for reading DiceKeys.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  DiceKeys are backup security keys that prevent lockouts and make it easier to adopt stronger online security.

  Reliable and trustworthy by design
  Readable by your devices and your own eyes

  DiceKeys can be read by most any phone, tablet, or computer.
  Or, you can use your own eyes to read each face by its:
  letter, which identifies the die
  digit, which identifies the face of the die, and
  orientation (rotation) of the face relative to the box

  The lines and dots are error-correction codes. Each line contains a redundant encoding of the letter and digit on the face of the die. Our algorithms use them to orient and double check the letter and digit.
  Open and tangible
  Our open software for reading DiceKeys and performing cryptographic operations with them is available for you to inspect, compile, modify, and use for eternity.
  In contrast to hardware designed to resist inspection, you can inspect every aspect of DiceKeys with your own eyes. Your security is literally in your own hands.
  Designed to last a human lifetime
  Most products are designed to be replaced, and many technology products are designed to be replaced dozens of times over a human lifetime. In contrast, one need only open up a decades-old game to observe the longevity of dice.
  Future-proof
  In 50 years, our devices may no longer support Bluetooth or USB-C, but we will still have eyes and our devices will still have cameras. Even if the company behind DiceKeys is long gone, our license gives you access to use our software for eternity, and allows the open-source community to maintain and improve it.
                       DESC

  s.homepage         = 'https://github.com/dicekeys/read-dicekey-ios'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'Copyright DiceKeys, LLC', :file => 'LICENSE.md' }
  s.author           = { 'Nikita Titov' => 'nmtitov@ya.ru' }
  s.source           = { :git => 'https://github.com/dicekeys/read-dicekey-ios.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '14.1'

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
  s.prepare_command = 'zsh ./run_djinni.sh'
end
