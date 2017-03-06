//
//  UIImage.swift
//  SilverbackFramework
//
//  Created by Christian Otkjær on 20/04/15.
//  Copyright (c) 2015 Christian Otkjær. All rights reserved.
//

import UIKit

// MARK: - Save

extension UIImage
{
    class func documentDirectoryPath() -> String?
    {
        return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last
    }
    
    public func saveAs(_ type: String = "png", baseFileName: String = "image", folderPath: String? = nil) -> Bool
    {
        guard let folderPath = folderPath ?? UIImage.documentDirectoryPath() else { return false }
        
        let filePath = folderPath + "/" + baseFileName + "." + type
        
        switch type
        {
        case "png", "PNG":
            return (try? UIImagePNGRepresentation(self)?.write(to: URL(fileURLWithPath: filePath), options: [])) != nil
            
        case "jpg", "jpeg", "JPG":
            return (try? UIImageJPEGRepresentation(self, 0.8)?.write(to: URL(fileURLWithPath: filePath), options: [])) != nil
            
        default:
            return false
        }
    }
}


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

// MARK: - Scale

extension UIImage
{
    public func imageScaledToSize(_ scaledSize: CGSize) -> UIImage
    {
        // In next line, pass 0 to use the current device's pixel scaling factor (and thus account for Retina resolution).
        // Pass 1 to force exact pixel size.
        UIGraphicsBeginImageContextWithOptions(scaledSize, false, 0)
        defer { UIGraphicsEndImageContext() }
        
        draw(in: CGRect(origin: CGPoint.zero, size: scaledSize))
        
        return UIGraphicsGetImageFromCurrentImageContext()!
    }
    
    fileprivate func compositeImage(_ path:UIBezierPath, usingBlendMode blend: CGBlendMode) -> UIImage
    {
        let pathBounds = path.bounds
        
        path.apply(CGAffineTransform(translationX: -pathBounds.origin.x, y: -pathBounds.origin.y))
        
        // Create Image context the size of the paths bounds
        UIGraphicsBeginImageContextWithOptions(pathBounds.size, false, scale)
        defer { UIGraphicsEndImageContext() }
        
        // First draw an opaque path...
        UIColor.black.setFill()
        path.fill()
        
        // ...then composite with the image.
        
        draw(at: CGPoint(x: -pathBounds.origin.x, y: -pathBounds.origin.y), blendMode: blend, alpha: 1)
        
        return UIGraphicsGetImageFromCurrentImageContext()!
    }
    
    public func imageByMaskingToAreaInsidePath(_ maskPath: UIBezierPath) -> UIImage
    {
        return compositeImage(maskPath, usingBlendMode: CGBlendMode.sourceIn)
    }
    
    public func imageByMaskingToAreaOutsidePath(_ maskPath: UIBezierPath) -> UIImage
    {
        return compositeImage(maskPath, usingBlendMode: CGBlendMode.sourceOut)
    }
}
