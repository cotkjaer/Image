//
//  UIImage+Overlay.swift
//  Image
//
//  Created by Christian Otkjær on 06/03/17.
//  Copyright © 2017 Christian Otkjær. All rights reserved.
//

import UIKit

extension UIImage
{
    /** Overlay image with a given color
     
    - parameter color: the color to overlay
     
    - returns: This image overlayed with a `bounds` sized rectangle using Porter-Duff blend mode **Overlay**
 */
    
    public func overlay(color: UIColor) -> UIImage
    {
        let bounds = CGRect(origin: CGPoint.zero, size: size)
        
        UIGraphicsBeginImageContextWithOptions(size, !hasAlpha, 0)
        
        defer { UIGraphicsEndImageContext() }
        
        draw(in: bounds)
        
        color.setFill()
        
        UIRectFillUsingBlendMode(bounds, .overlay)
        
        return UIGraphicsGetImageFromCurrentImageContext()!
        
    }
}
