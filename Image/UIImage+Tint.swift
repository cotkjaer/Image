//
//  UIImage+Tint.swift
//  Image
//
//  Created by Christian Otkjær on 06/03/17.
//  Copyright © 2017 Christian Otkjær. All rights reserved.
//

//MARK: - Tint

extension UIImage
{
    public func tintedGradientImageWithColor(_ tintColor: UIColor) -> UIImage
    {
        return tintedImageWithColor(tintColor, blendingMode: .overlay)
    }
    
    public func tintedImageWithColor(_ tintColor: UIColor) -> UIImage
    {
        return tintedImageWithColor(tintColor, blendingMode: .destinationIn)
    }
    
    fileprivate func tintedImageWithColor(_ tintColor: UIColor, blendingMode blendMode: CGBlendMode) -> UIImage
    {
        let bounds = CGRect(origin: CGPoint.zero, size: size)
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        
        defer { UIGraphicsEndImageContext() }
        
        tintColor.setFill()
        
        UIRectFill(bounds)
        
        draw(in: bounds, blendMode: blendMode, alpha: 1)
        
        if blendMode != .destinationIn
        {
            draw(in: bounds, blendMode: .destinationIn, alpha: 1)
        }
        
        return UIGraphicsGetImageFromCurrentImageContext()!
    }
}
