//
//  SNCScanditScanViewController.h
//  ScanditScanPlugin
//
//  Created by Ivan Yanakiev on 5.04.22.
//  Copyright © 2022 Sonect. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class SDCDataCaptureContext, SDCBarcodeCapture;

@interface SNCScanditScanViewController : UIViewController

- (instancetype)initWithContext:(SDCDataCaptureContext *)context barcodeCapture:(SDCBarcodeCapture *)barcodeCapture;

@end

NS_ASSUME_NONNULL_END
