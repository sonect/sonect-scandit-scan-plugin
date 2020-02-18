//
//  SNCScanditScanPlugin.h
//  ScanditScanPlugin
//
//  Created by Marko Hlebar on 18/02/2020.
//  Copyright © 2020 Sonect. All rights reserved.
//

#import <SonectShop/SNCScanCodePlugin.h>

NS_ASSUME_NONNULL_BEGIN

@interface SNCScanditScanPlugin : NSObject <SNCScanCodePlugin>

/// Initializes the plugin with a license key.
/// @param licenseKey a valid Scandit license key.
- (instancetype)initWithLicenseKey:(NSString *)licenseKey;

@end

NS_ASSUME_NONNULL_END
