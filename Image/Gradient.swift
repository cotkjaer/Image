//
//  Gradient.swift
//  Image
//
//  Created by Christian Otkjær on 02/03/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

import Clamp

// MARK: - Gradient

private func createGradientWithColors(colors: [UIColor]) -> CGGradientRef?
{
    //        let beginColor = UIColor(white: 1, alpha: 1).CGColor
    //        let endColor = UIColor(white: 1, alpha: 0).CGColor
    //
    //        let colors = [beginColor, endColor]
    
    return CGGradientCreateWithColors(CGColorSpaceCreateDeviceRGB(), colors.map({$0.CGColor}) , nil)
}

private let GradientDrawingOptions : CGGradientDrawingOptions = [.DrawsBeforeStartLocation, .DrawsAfterEndLocation]

extension UIImage
{
    public static func imageWithRadialGradient(size: CGSize,
        startAnchor: CGPoint = CGPoint(x: 0.5, y: 0.5),
        endAnchor: CGPoint = CGPoint(x: 0.5, y: 0.5),
        colors: [UIColor] = [UIColor(white: 1, alpha: 1), UIColor(white: 1, alpha: 0)]) -> UIImage?
    {
        guard let gradient = createGradientWithColors(colors) else { return nil }
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        
        defer { UIGraphicsEndImageContext() }
        
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        
        let startCenter = CGPoint(x: size.width * startAnchor.x.clamped(0, 1), y: size.height * startAnchor.y.clamped(0, 1))
        let endCenter = CGPoint(x: size.width * endAnchor.x.clamped(0, 1), y: size.height * endAnchor.y.clamped(0, 1))
        
//        let startRadius = max(max(size.width - startCenter.x, startCenter.x), max(size.height - startCenter.y, startCenter.y))
        let endRadius = max(max(size.width - endCenter.x, endCenter.x), max(size.height - endCenter.y, endCenter.y))
//        let radius = max(startRadius, endRadius)
        
        CGContextDrawRadialGradient(context, gradient, startCenter, 0, endCenter, endRadius, GradientDrawingOptions)
        
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    public static func imageWithGradient(size: CGSize,
        startAnchor: CGPoint = CGPoint(x: 0, y: 0.5),
        endAnchor: CGPoint = CGPoint(x: 1, y: 0.5),
        colors: [UIColor] = [UIColor(white: 1, alpha: 1), UIColor(white: 1, alpha: 0)]) -> UIImage?
    {
        guard let gradient = createGradientWithColors(colors) else { return nil }
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        
        defer { UIGraphicsEndImageContext() }
        
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        
        let startPoint = CGPoint(x: size.width * startAnchor.x.clamped(0, 1), y: size.height * startAnchor.y.clamped(0, 1))
        let endPoint = CGPoint(x: size.width * endAnchor.x.clamped(0, 1), y: size.height * endAnchor.y.clamped(0, 1))
        
        CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, GradientDrawingOptions)
        
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    
    //        var gradientAnchor : CGPoint = CGPoint(x: 0.5,y: 0.5)
        
        //    let locations : [CGFloat] = [0, 0.25, 1]
        
        //        let colors : [CGFloat] = [1, 1, 1, 1, /*last color:*/0, 0, 1, 1]//0.15]
        
        //        lazy var gradient : CGGradientRef? = { return CGGradientCreateWithColorComponents(CGColorSpaceCreateDeviceRGB(), self.colors, self.locations, self.locations.count) }()
        
//    
//        private func createImage() -> UIImage?
//        {
//            UIGraphicsBeginImageContextWithOptions(bounds.size, false, 0)
//            
//            defer { UIGraphicsEndImageContext() }
//            
//            if let context = UIGraphicsGetCurrentContext()
//            {
//                let gradient = createGradient()
//                
//                let center = bounds.center
//                
//                let radius = max(center.x, center.y)
//                
//                CGContextDrawRadialGradient(context, gradient, center, 0, center, radius,
//                    [.DrawsBeforeStartLocation, .DrawsAfterEndLocation])
//                
//                return UIGraphicsGetImageFromCurrentImageContext()
//            }
//            
//            return nil
//        }
}
