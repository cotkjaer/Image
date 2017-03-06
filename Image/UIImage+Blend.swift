//
//  UIImage+Blend.swift
//  Image
//
//  Created by Christian Otkjær on 06/03/17.
//  Copyright © 2017 Christian Otkjær. All rights reserved.
//

extension UIImage
{
    /** Blend this image with a given color
     
     - parameter color: the color to use for blending
     - parameter blendMode: the desired Porter-Duff blend mode, defaults to overlay
     
     - returns: This image overlayed with a `bounds` sized rectangle using
     */
    
    public func blendedWith(color: UIColor, using blendMode: CGBlendMode = .overlay) -> UIImage?
    {
        let bounds = CGRect(origin: CGPoint.zero, size: size)
        
        UIGraphicsBeginImageContextWithOptions(size, !hasAlpha, 0)
        
        defer { UIGraphicsEndImageContext() }
        
        draw(in: bounds)
        
        color.setFill()
        
        UIRectFillUsingBlendMode(bounds, blendMode)
        
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}
