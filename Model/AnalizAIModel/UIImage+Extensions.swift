//
//  UIImage+Extensions.swift
//  AkıllıTabak
//
//  Created by BAHAR ATBAŞ on 19.04.2026.
//

import Foundation
import UIKit
import CoreML

extension UIImage {

    func resizeTo224() -> UIImage? {
        let size = CGSize(width: 224, height: 224)
        UIGraphicsBeginImageContextWithOptions(size, false, 1.0)
        self.draw(in: CGRect(origin: .zero, size: size))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }

    func toPixelBuffer() -> CVPixelBuffer? {
        let attrs = [
            kCVPixelBufferCGImageCompatibilityKey: true,
            kCVPixelBufferCGBitmapContextCompatibilityKey: true
        ] as CFDictionary

        var pixelBuffer: CVPixelBuffer?
        let status = CVPixelBufferCreate(
            kCFAllocatorDefault,
            Int(self.size.width),
            Int(self.size.height),
            kCVPixelFormatType_32ARGB,
            attrs,
            &pixelBuffer
        )

        guard status == kCVReturnSuccess else { return nil }

        CVPixelBufferLockBaseAddress(pixelBuffer!, [])

        let context = CGContext(
            data: CVPixelBufferGetBaseAddress(pixelBuffer!),
            width: Int(self.size.width),
            height: Int(self.size.height),
            bitsPerComponent: 8,
            bytesPerRow: CVPixelBufferGetBytesPerRow(pixelBuffer!),
            space: CGColorSpaceCreateDeviceRGB(),
            bitmapInfo: CGImageAlphaInfo.noneSkipFirst.rawValue
        )

        guard let cgImage = self.cgImage else { return nil }

        context?.draw(cgImage, in: CGRect(
            x: 0,
            y: 0,
            width: self.size.width,
            height: self.size.height
        ))

        CVPixelBufferUnlockBaseAddress(pixelBuffer!, [])
        return pixelBuffer
    }
}
