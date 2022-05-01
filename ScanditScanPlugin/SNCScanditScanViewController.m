//
//  SNCScanditScanViewController.m
//  ScanditScanPlugin
//
//  Created by Ivan Yanakiev on 5.04.22.
//  Copyright © 2022 Sonect. All rights reserved.
//

#import "SNCScanditScanViewController.h"
#import <ScanditCaptureCore/ScanditCaptureCore.h>
#import <ScanditBarcodeCapture/ScanditBarcodeCapture.h>

@interface SNCScanditScanViewController ()

@property (nonatomic) SDCDataCaptureContext *context;
@property (nonatomic) SDCBarcodeCapture *barcodeCapture;
@property (nonatomic) SDCBarcodeCaptureOverlay *overlay;
@property (nonatomic) SDCDataCaptureView *captureView;

@end

@implementation SNCScanditScanViewController

- (instancetype)initWithContext:(SDCDataCaptureContext *)context barcodeCapture:(SDCBarcodeCapture *)barcodeCapture {
    self = [super initWithNibName:nil bundle:[NSBundle bundleForClass:[self class]]];
    if (self) {
        self.context = context;
        self.barcodeCapture = barcodeCapture;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.captureView = [SDCDataCaptureView dataCaptureViewForContext:self.context frame:self.view.bounds];
    self.captureView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    [self.view addSubview:self.captureView];
    
    self.overlay = [SDCBarcodeCaptureOverlay overlayWithBarcodeCapture:self.barcodeCapture forDataCaptureView:self.captureView];
    self.overlay.viewfinder = [SDCRectangularViewfinder viewfinder];
}

@end
