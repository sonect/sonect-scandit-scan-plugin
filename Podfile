# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'
source 'https://github.com/CocoaPods/Specs.git'

target 'ScanditScanPlugin' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  pod 'sonect-core-ios'

end

target 'ScanPluginIntegrationApp' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  pod 'sonect-shop-sdk-ios'
  pod 'sonect-core-ios'

end

post_install do |installer|
  installer.pods_project.build_configurations.each do |config|
    config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
  end
end

