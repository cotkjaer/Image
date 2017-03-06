//
//  UIImage+Scale.swift
//  Image
//
//  Created by Christian Otkjær on 06/03/17.
//  Copyright © 2017 Christian Otkjær. All rights reserved.
//

// MARK: - Scale

extension UIImage
{
    /** Scale this image to a given size
     
    - parameter scaledSize: The size of the resulting image
     */
    public func scaledToSize(_ scaledSize: CGSize) -> UIImage
    {
        // In next line, pass 0 to use the current device's pixel scaling factor (and thus account for Retina resolution).
        // Pass 1 to force exact pixel size.
        UIGraphicsBeginImageContextWithOptions(scaledSize, false, 0)
       
        defer { UIGraphicsEndImageContext() }
        
        draw(in: CGRect(origin: .zero, size: scaledSize))
        
        return UIGraphicsGetImageFromCurrentImageContext()!
    }
    
}
