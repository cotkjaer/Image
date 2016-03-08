//
//  UIImage+Alpha.swift
//  Image
//
//  Created by Christian Otkjær on 08/03/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

// MARK: - Alpha

import CoreGraphics

extension UIImage
{
    // Returns true if the image has an alpha layer
    public var hasAlpha : Bool
        {
            switch CGImageGetAlphaInfo(self.CGImage)
            {
            case .First, .Last, .PremultipliedFirst, .PremultipliedLast:
                return true
                
            default:
                return false
            }
    }
}
