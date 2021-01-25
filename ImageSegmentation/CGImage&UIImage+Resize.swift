//
//  UIImage+Resize.swift
//  ImageSegmentation
//
//  Created by zero on 2021/1/25.
//

import UIKit

extension UIImage {
    func orientationNormalized() -> UIImage {
        UIGraphicsBeginImageContext(size)
        self.draw(at: CGPoint.zero)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }
    
    // scaled to new size
    func resized(width: CGFloat, height: CGFloat) -> UIImage {
        UIGraphicsBeginImageContext(CGSize(width: width, height: height))
        self.draw(in: CGRect(x: 0.0, y: 0.0, width: width, height: height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }
    
    func resized(to size: CGSize) -> UIImage {
        return resized(width: size.width, height: size.height)
    }
    
    func resized(width: Int, height: Int) -> UIImage {
        return resized(width: CGFloat(width), height: CGFloat(height))
    }
}

extension CGImage {
    func resized(width: Int, height: Int) -> CGImage {
        let context = CGContext(
            data: nil,
            width: width,
            height: height,
            bitsPerComponent: 8,
            bytesPerRow: width * 4,
            space: CGColorSpace(name: CGColorSpace.sRGB)!,
            bitmapInfo: CGBitmapInfo.byteOrder32Little.rawValue + CGImageAlphaInfo.premultipliedFirst.rawValue
        )!
        let rect = CGRect(x: 0, y: 0, width: width, height: height)
        context.draw(self, in: rect)
        return context.makeImage()!
    }
    
    func resized(to size: CGSize) -> CGImage {
        return self.resized(width: Int(size.width), height: Int(size.height))
    }
}
