//
//  ViewController.swift
//  ScanPluginIntegrationApp
//
//  Created by Marko Hlebar on 18/02/2020.
//  Copyright © 2020 Sonect. All rights reserved.
//

import UIKit
import SonectShop
import SonectCore
import ScanditScanPlugin
import AVFoundation

class ViewController: UIViewController {
    let scanditPlugin = SNCScanditScanPlugin(licenseKey: "AYSRIANoJzVqE5r5JQ9HZI5EHqjiC0PZGhb+ay5ZY9Emf+33hn1522scPLnKQiEqjzD1la5Rfh8lXAWn4UQyK/VcG6U4QqjFcF4x119J7pfHYWqOhWfXFcAoedf/bqSsGUrP9JlZJ9QiAjJvJy3HmIoeukb1KRYgbRNo+z5rkWkGYAywdT6EFC50glbBCkzvdI5V0nfJAVKgSrLH7EA17DF958VCovQOO34/3DWpymjBeB6xFOJnFMuM2KrYE39idAw8gc7wrjd11WfhDOoihuoYwYzToSwIAhIZqTQ29+Sg8T04O0Cg63Btp7DbCoAcmbA2ioHJ5ALxMkDjT4vXoq0wR1tx/VTP0qnGiSF8k/fLDSANyivMws3Y5PnDQiSZmtPt5XZmXrD+RM5DxAz4bclh6Mvq8IZySACfkKTUdAKuDO2L1MAHHoAnFogdpX5OhSEx6FVb7ZHN1q6YVy+W7MqsJ7AdC+qG0QJaOQcqIrBvo4Il/FDacl1h1VDXdS3gfK5gBo9WwT3KQ4E5Xrraa9t3xWK+NwQ0KY2UAWyJc/XxQnKgeFW9zDJhUHI9z15+PItqybQY6hIMq0uK7yK5hNffvjhaYBeJcRqxiJ6NAOdcWjb2axz+3XqPi2IWilY25q4MR90hfdfpKOb1U/8Oi3Z7hnPy2dX6WEfRNDNBGVt9U7bMwjWyACasS0XSSuHdb+NROIutjz+UY01MHHfsfS5wp2XkL2I+KvJMdtzwjzcPMIC0Gis2fW74TYHGTQ/tGN3Pm8akBQ/BmKaK8snE+yGmqI7KxYdMDpffvJw3lvoKOu2hXmngRo6FovJGuan1ZVkclK9A+W/wFw==")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let scanViewController = scanditPlugin.viewController()
        addChild(scanViewController)
        let scanView = scanViewController.view
        view.addSubview(scanView!)
        scanView?.translatesAutoresizingMaskIntoConstraints = false
        scanView?.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scanView?.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scanView?.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scanView?.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        scanViewController.didMove(toParent: self)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .notDetermined:
                AVCaptureDevice.requestAccess(for: .video) { granted in
                }
        default:
            break
        }
        
        scanditPlugin.scan { [weak self] scanResult, error in
            print("Scan result " + (scanResult ?? "None"))
        }
    }
}

