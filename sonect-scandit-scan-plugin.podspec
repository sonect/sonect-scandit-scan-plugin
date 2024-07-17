Pod::Spec.new do |spec|

    spec.name         = "sonect-scandit-scan-plugin"
    spec.version      = "1.2.6"
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
    
    spec.platform     = :ios, "13.0"
    spec.source       = { :git => "https://github.com/sonect/sonect-scandit-scan-plugin.git", :tag => spec.version }
    spec.source_files       = 'ScanditScanPlugin/*.m', 'ScanditScanPlugin/*.h', 'Scandit/*.framework', 'ScanditScanPlugin/Classes/*.swift'
    spec.swift_version = '5.0'

    spec.dependency 'sonect-core-ios'
    spec.dependency 'ScanditBarcodeCapture'

    #this don't pass pod lib lint until this is fixed
    spec.pod_target_xcconfig = { 'BUILD_LIBRARY_FOR_DISTRIBUTION' => 'YES' }


  end
  
