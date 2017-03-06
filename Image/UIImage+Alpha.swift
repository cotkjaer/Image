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
    public var hasAlpha: Bool
        {
        guard let cgImage = self.cgImage else { return false }

            switch cgImage.alphaInfo
            {
            case .first, .last, .premultipliedFirst, .premultipliedLast:
                return true
                
            default:
                return false
            }
    }
}
