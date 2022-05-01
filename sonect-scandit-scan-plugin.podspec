Pod::Spec.new do |spec|

    spec.name         = "sonect-scandit-scan-plugin"
    spec.version      = "1.2.0"
    spec.summary      = "Sonect Scandit Scan Plugin"
    spec.description  = <<-DESC
    This is the Sonect Scandit Scan Plugin public podspec. 
                     DESC
  
    spec.homepage     = "https://github.com/sonect/sonect-scandit-scan-plugin"
    spec.license      = { :type => "Sonect Closed Source", :text => <<-LICENSE
                      Copyright (C) Sonect AG - All Rights Reserved
                      Unauthorized copying of this file, and the Sonect SDK via any medium is strictly prohibited
                      Proprietary and confidential
                      Sonect, February 2012. 
                      LICENSE
                 }
    spec.author             = { "sonect" => "marko.hlebar@sonect.ch" }
    spec.platform     = :ios, "9.0"
    spec.source       = { :http => "https://github.com/sonect/sonect-scandit-scan-plugin/releases/download/#{spec.version}/ScanditScanPlugin_Cocoapods.framework.zip" }
    spec.ios.vendored_frameworks = 'ScanditScanPlugin.xcframework'
  
  end
  
