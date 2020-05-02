#
# Be sure to run `pod lib lint composablelayout.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'composablelayout'
  s.version          = '0.1.2'
  s.summary          = 'ComposableLayout allow you to make complex layout with their own view controllers and their lifecycles.'
  s.swift_version    = '4.2'
  s.description      = "ComposableLayout helps you to make complex layouts allow you to add any view controller inside it. ComposableLayout rely on UIScrollView and calculates own content size based on view controllers height."
  s.homepage         = 'https://github.com/serhatsezer/ComposableLayout'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Serhat Sezer' => 'serhat.szr@gmail.com' }
  s.source           = { :git => 'https://github.com/serhatsezer/ComposableLayout.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/serhatsezer'
  s.ios.deployment_target = '10.0'
  s.source_files = 'composablelayout/Classes/**/*'
end
