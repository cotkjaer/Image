//
//  UIImage+Mask.swift
//  Image
//
//  Created by Christian Otkjær on 06/03/17.
//  Copyright © 2017 Christian Otkjær. All rights reserved.
//

extension UIImage
{
    private func compositeImage(_ path:UIBezierPath, usingBlendMode blend: CGBlendMode) -> UIImage
    {
        let pathBounds = path.bounds
        
        path.apply(CGAffineTransform(translationX: -pathBounds.origin.x, y: -pathBounds.origin.y))
        
        // Create Image context the size of the paths bounds
        UIGraphicsBeginImageContextWithOptions(pathBounds.size, !hasAlpha, scale)
        defer { UIGraphicsEndImageContext() }
        
        // First draw an opaque path...
        UIColor.black.setFill()
        path.fill()
        
        // ...then composite with the image.
        
        draw(at: CGPoint(x: -pathBounds.origin.x, y: -pathBounds.origin.y), blendMode: blend, alpha: 1)
        
        return UIGraphicsGetImageFromCurrentImageContext()!
    }
    
    /** Apply the given path to this image as a mask
     - parameter path: Mask-path
     - parameter inside: Flag use to indicate whether the inside or the outside of the path should be used for masking
     - returns: the masked image
     */
    public func masked(by path: UIBezierPath, inside: Bool = true) -> UIImage
    {
        return compositeImage(path, usingBlendMode: inside ? .sourceIn : .sourceOut)
    }
}
