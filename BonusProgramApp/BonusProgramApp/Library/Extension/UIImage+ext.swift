//
//  UIImage+ext.swift
//  BonusProgramApp
//
//  Created by Михайлов Александр on 08.08.2023.
//

import UIKit
import CoreImage.CIFilterBuiltins

extension UIImage {
    /// Generate QR code from string
    static func generateQRCode(from string: String) -> UIImage {
        let context = CIContext()
        let filter = CIFilter.qrCodeGenerator()
        
        filter.message = Data(string.utf8)

        if let outputImage = filter.outputImage {
            let transformedImage = outputImage.transformed(by: CGAffineTransformMakeScale(20, 20))

            if let cgimg = context.createCGImage(transformedImage, from: transformedImage.extent) {
                return UIImage(cgImage: cgimg)
            }
        }

        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
}
