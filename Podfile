# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'
source 'https://github.com/CocoaPods/Specs.git'
 
target 'ScanditScanPlugin' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  pod 'sonect-core-sdk-ios'
  pod 'ScanditBarcodeCapture', '6.12'
end

target 'ScanPluginIntegrationApp' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

 # pod 'sonect-shop-sdk-ios'
 # pod 'sonect-core-sdk-ios'
 # pod 'ScanditBarcodeCapture', '6.12'
end


post_install do |installer|
  installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
          config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
	  config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
          config.build_settings['ENABLE_BITCODE'] = 'NO'
          config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
      end
  end
end
