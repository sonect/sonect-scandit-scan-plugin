//
//  SNCScanditScanPlugin.m
//  ScanditScanPlugin
//
//  Created by Marko Hlebar on 18/02/2020.
//  Copyright © 2020 Sonect. All rights reserved.
//

#import "SNCScanditScanPlugin.h"
#import <ScanditBarcodeScanner/ScanditBarcodeScanner.h>
#import <SonectShop/SNCScanCodePlugin.h>

@interface SNCScanditScanPlugin ()
@property (nonatomic, strong) SBSBarcodePicker *picker;
@property (nonatomic, copy) SNCScanCodeResultHandler resultHandler;
@end

@interface SNCScanditScanPlugin (Scandit) <SBSScanDelegate>
@end

@implementation SNCScanditScanPlugin

- (instancetype)initWithLicenseKey:(NSString *)licenseKey {
    self = [super init];
    if (self) {
        [SBSLicense setAppKey:licenseKey];
    }
    return self;
}

- (SBSBarcodePicker *)picker {
    if (_picker) { return _picker; }
    
    SBSScanSettings *scanSettings = [SBSScanSettings defaultSettings];
    scanSettings.cameraFacingPreference = SBSCameraFacingDirectionBack;
    [scanSettings setSymbology:SBSSymbologyQR enabled:YES];
    [scanSettings setSymbology:SBSSymbologyCode128 enabled:YES];
    
    SBSSymbologySettings *symSettings = [scanSettings settingsForSymbology:SBSSymbologyCode128];
    
    NSArray *activeSymbols = @[@7, @8, @9, @10, @11, @12, @13, @14, @15, @16, @17, @18, @19, @20, @22, @23, @24, @25, @26, @27, @28, @29, @30, @31, @32, @33, @34, @35, @36, @37, @38, @39, @40, @41, @42, @43, @44, @45, @46, @47, @48, @49, @50];
    [symSettings setActiveSymbolCounts:[NSSet setWithArray:activeSymbols]];
    
    _picker = [[SBSBarcodePicker alloc] initWithSettings:scanSettings];
    _picker.scanDelegate = self;
    [_picker switchTorchOn:NO];
    return _picker;
}

- (void)scan:(nonnull SNCScanCodeResultHandler)handler {
    self.resultHandler = handler;
    [self.picker startScanning];
}

- (void)stop {
    self.resultHandler = nil;
    [self.picker stopScanning];
}

- (nonnull UIViewController *)viewController {
    return self.picker;
}

@end

@implementation SNCScanditScanPlugin (Scandit)

- (void)barcodePicker:(nonnull SBSBarcodePicker*)picker didScan:(nonnull SBSScanSession*)session {
    SBSCode *code = session.allRecognizedCodes.lastObject;
    NSString *value = code.data;
    
    if (!value) {
        return;
    }
    
    self.resultHandler(value, nil);
}

@end
