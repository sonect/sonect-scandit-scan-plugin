//
//  SNCScanditScanPlugin.m
//  ScanditScanPlugin
//
//  Created by Marko Hlebar on 18/02/2020.
//  Copyright © 2020 Sonect. All rights reserved.
//

#import "SNCScanditScanPlugin.h"
#import <ScanditCaptureCore/ScanditCaptureCore.h>
#import <ScanditBarcodeCapture/ScanditBarcodeCapture.h>
#import <SonectCore/SNCScanCodePlugin.h>
#import "SNCScanditScanViewController.h"

@interface SNCScanditScanPlugin ()
@property (nonatomic, copy) SNCScanCodeResultHandler resultHandler;
@property (nonatomic, strong) SDCDataCaptureContext *context;
@property (nonatomic, strong) SNCScanditScanViewController *scanditPluginViewController;
@property (nonatomic, strong, nullable) SDCCamera *camera;
@property (nonatomic, strong) SDCBarcodeCapture *barcodeCapture;
@end

@interface SNCScanditScanPlugin (Scandit) <SDCBarcodeCaptureListener>
@end

@implementation SNCScanditScanPlugin

- (instancetype)initWithLicenseKey:(NSString *)licenseKey {
    self = [super init];
    if (self) {
        self.context = [SDCDataCaptureContext contextForLicenseKey:licenseKey];
        [self setupBarcodeCapture];
    }
    return self;
}

- (SNCScanditScanViewController *)scanditPluginViewController {
    if (!_scanditPluginViewController) {
        _scanditPluginViewController = [[SNCScanditScanViewController alloc] initWithContext:self.context barcodeCapture:self.barcodeCapture];
    }
    
    return _scanditPluginViewController;
}

- (SDCBarcodeCaptureSettings *)settings {
    SDCBarcodeCaptureSettings *settings = [SDCBarcodeCaptureSettings settings];
    [settings setSymbology:SDCSymbologyQR enabled:YES];
    [settings setSymbology:SDCSymbologyCode128 enabled:YES];
    
    return settings;
}

- (void)setupBarcodeCapture {
    self.barcodeCapture = [SDCBarcodeCapture barcodeCaptureWithContext:self.context settings:self.settings];
    [self.barcodeCapture addListener:self];
    [self setupCamera:SDCCameraPositionWorldFacing];
}

- (void)setupCamera:(SDCCameraPosition)cameraPosition {
    if (self.camera) {
        [self.camera switchToDesiredState:SDCFrameSourceStateOff];
    }
    
    SDCCameraSettings *cameraSettings = SDCBarcodeCapture.recommendedCameraSettings;
    
    self.camera = [SDCCamera cameraAtPosition:cameraPosition];
    [self.camera applySettings:cameraSettings completionHandler:nil];
    [self.context setFrameSource:self.camera completionHandler:nil];
    
    [self.camera switchToDesiredState:SDCFrameSourceStateOn];
}

- (void)scan:(nonnull SNCScanCodeResultHandler)handler {
    self.resultHandler = handler;
    self.barcodeCapture.enabled = YES;
    [self.camera switchToDesiredState:SDCFrameSourceStateOn];
}

- (void)stop {
    self.resultHandler = nil;
    self.barcodeCapture.enabled = NO;
    [self.camera switchToDesiredState:SDCFrameSourceStateOff];
}

- (nonnull UIViewController *)viewController {
    return self.scanditPluginViewController;
}

- (BOOL)toggleCameraFacingDirection {
    SDCCameraPosition desiredCameraPosition = self.camera.position == SDCCameraPositionWorldFacing ? SDCCameraPositionUserFacing : SDCCameraPositionWorldFacing;
    
    [self setupCamera:desiredCameraPosition];

    return YES;
}

@end

@implementation SNCScanditScanPlugin (Scandit)

- (void)barcodeCapture:(SDCBarcodeCapture *)barcodeCapture didScanInSession:(SDCBarcodeCaptureSession *)session frameData:(id<SDCFrameData>)frameData {
    SDCBarcode *barcode = [session.newlyRecognizedBarcodes firstObject];
      if (barcode == nil || barcode.data == nil) {
          return;
      }
    
    NSString *value = barcode.data;

    self.resultHandler(value, nil);
}

@end
