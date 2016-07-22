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
    public static func imageWithText(attributedText: NSAttributedString) -> UIImage
    {
        UIGraphicsBeginImageContextWithOptions(attributedText.size(), false, 0)//UIScreen.mainScreen().scale)
        defer { UIGraphicsEndImageContext() }
        
        attributedText.drawAtPoint(CGPointZero)
        
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    public convenience init?(attributedText: NSAttributedString)
    {
        guard let cgimage = UIImage.imageWithText(attributedText).CGImage else { return nil }
        
        self.init(CGImage: cgimage)
    }
    
    public convenience init?(text: String, textFont: UIFont, textColor: UIColor)
    {
        let textAttributes = [ NSFontAttributeName: textFont, NSForegroundColorAttributeName: textColor ]
        
        let aText = NSAttributedString(string: text, attributes: textAttributes)
        
        self.init(attributedText: aText)
    }
    
    public func imageWithAddedText(text: String, textFont: UIFont = UIFont.systemFontOfSize(UIFont.systemFontSize()), textColor: UIColor = UIColor.darkTextColor()) -> UIImage
    {
        let textAttributes = [ NSFontAttributeName: textFont, NSForegroundColorAttributeName: textColor ]
        
        let aText = NSAttributedString(string: text, attributes: textAttributes)

        return imageWithAddedAttributedText(aText)
    }
    
    public func imageWithAddedAttributedText(text: NSAttributedString) -> UIImage
    {
        UIGraphicsBeginImageContextWithOptions(size, !hasAlpha, 0)//UIScreen.mainScreen().scale)
        
        defer { UIGraphicsEndImageContext() }
        
        drawAtPoint(CGPointZero)
        
        let x = (size.width - text.size().width) / 2
        let y = (size.height - text.size().height) / 2
        
        text.drawAtPoint(CGPoint(x: x, y: y))
        
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}