//
//  UIImage+Text.swift
//  Image
//
//  Created by Christian Otkjær on 21/07/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

import Foundation

extension UIImage
{
    public static func imageWithText(_ attributedText: NSAttributedString) -> UIImage
    {
        UIGraphicsBeginImageContextWithOptions(attributedText.size(), false, 0)//UIScreen.mainScreen().scale)
        defer { UIGraphicsEndImageContext() }
        
        attributedText.draw(at: CGPoint.zero)
        
        return UIGraphicsGetImageFromCurrentImageContext()!
    }
    
    public convenience init?(attributedText: NSAttributedString)
    {
        guard let cgimage = UIImage.imageWithText(attributedText).cgImage else { return nil }
        
        self.init(cgImage: cgimage)
    }
    
    public convenience init?(text: String, textFont: UIFont, textColor: UIColor)
    {
        let textAttributes = [ NSFontAttributeName: textFont, NSForegroundColorAttributeName: textColor ]
        
        let aText = NSAttributedString(string: text, attributes: textAttributes)
        
        self.init(attributedText: aText)
    }
    
    public func imageWithAddedText(_ text: String, textFont: UIFont = UIFont.systemFont(ofSize: UIFont.systemFontSize), textColor: UIColor = UIColor.darkText) -> UIImage
    {
        let textAttributes = [ NSFontAttributeName: textFont, NSForegroundColorAttributeName: textColor ]
        
        let aText = NSAttributedString(string: text, attributes: textAttributes)

        return imageWithAddedAttributedText(aText)
    }
    
    public func imageWithAddedAttributedText(_ text: NSAttributedString) -> UIImage
    {
        UIGraphicsBeginImageContextWithOptions(size, !hasAlpha, 0)//UIScreen.mainScreen().scale)
        
        defer { UIGraphicsEndImageContext() }
        
        draw(at: CGPoint.zero)
        
        let x = (size.width - text.size().width) / 2
        let y = (size.height - text.size().height) / 2
        
        text.draw(at: CGPoint(x: x, y: y))
        
        return UIGraphicsGetImageFromCurrentImageContext()!
    }
}
