//
//  Gradient.swift
//  Image
//
//  Created by Christian Otkjær on 02/03/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

import Clamp
import Graphics

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
    public convenience init?(radialGradientOfSize size: CGSize,
        startAnchor: CGPoint = CGPoint(x: 0.5, y: 0.5),
        endAnchor: CGPoint = CGPoint(x: 0.5, y: 0.5),
        colors: [UIColor] = [UIColor(white: 1, alpha: 1), UIColor(white: 1, alpha: 0)])
    {
        guard let image = UIImage.imageWithRadialGradient(size, startAnchor: startAnchor, endAnchor: endAnchor, colors: colors)?.CGImage else { self.init(); return nil }
        
        self.init(CGImage: image)
    }
    
    private static func imageWithRadialGradient(size: CGSize,
        startAnchor: CGPoint,
        endAnchor: CGPoint,
        colors: [UIColor]) -> UIImage?
    {
        guard let gradient = createGradientWithColors(colors) else { return nil }

        let opaque = !colors.contains({ $0.CGColor.alpha < 1 })

        UIGraphicsBeginImageContextWithOptions(size, opaque, 0)
        
        defer { UIGraphicsEndImageContext() }
        
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        
        let startCenter = CGPoint(x: size.width * startAnchor.x.clamped(0, 1), y: size.height * startAnchor.y.clamped(0, 1))
        let endCenter = CGPoint(x: size.width * endAnchor.x.clamped(0, 1), y: size.height * endAnchor.y.clamped(0, 1))
        
        let endRadius = max(max(size.width - endCenter.x, endCenter.x), max(size.height - endCenter.y, endCenter.y))
        
        CGContextDrawRadialGradient(context, gradient, startCenter, 0, endCenter, endRadius, GradientDrawingOptions)
        
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    public convenience init?(linearGradientOfSize size: CGSize,
        startAnchor: CGPoint = CGPoint(x: 0, y: 0.5),
        endAnchor: CGPoint = CGPoint(x: 1, y: 0.5),
        colors: [UIColor] = [UIColor(white: 1, alpha: 1), UIColor(white: 1, alpha: 0)])
    {
        guard let image = UIImage.imageWithLinearGradient(size, startAnchor: startAnchor, endAnchor: endAnchor, colors: colors)?.CGImage else { self.init(); return nil }
        
        self.init(CGImage: image)
    }
    
    private static func imageWithLinearGradient(size: CGSize,
        startAnchor: CGPoint = CGPoint(x: 0, y: 0.5),
        endAnchor: CGPoint = CGPoint(x: 1, y: 0.5),
        colors: [UIColor] = [UIColor(white: 1, alpha: 1), UIColor(white: 1, alpha: 0)]) -> UIImage?
    {
        guard let gradient = createGradientWithColors(colors) else { return nil }
        
        let opaque = !colors.contains({ $0.CGColor.alpha < 1 })

        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        
        defer { UIGraphicsEndImageContext() }
        
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        
        let startPoint = CGPoint(x: size.width * startAnchor.x.clamped(0, 1), y: size.height * startAnchor.y.clamped(0, 1))
        let endPoint = CGPoint(x: size.width * endAnchor.x.clamped(0, 1), y: size.height * endAnchor.y.clamped(0, 1))
        
        CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, GradientDrawingOptions)
        
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}
