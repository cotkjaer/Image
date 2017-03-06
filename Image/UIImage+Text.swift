//
//  UIImage+Text.swift
//  Image
//
//  Created by Christian Otkjær on 21/07/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

import Arithmetic

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
    
    public convenience init?(text: String, textFont: UIFont = UIFont.systemFont(ofSize: UIFont.systemFontSize), textColor: UIColor = UIColor.darkText)
    {
        let textAttributes = [ NSFontAttributeName: textFont, NSForegroundColorAttributeName: textColor ]
        
        let aText = NSAttributedString(string: text, attributes: textAttributes)
        
        self.init(attributedText: aText)
    }
    
    public func withAdded(
        text: String?,
        font textFont: UIFont = UIFont.systemFont(ofSize: UIFont.systemFontSize),
        color textColor: UIColor = UIColor.darkText,
        alignent: CGPoint = CGPoint(x: 0.5, y: 0.5)
        ) -> UIImage
    {
        guard let text = text else { return self }

        
        let textAttributes = [ NSFontAttributeName: textFont, NSForegroundColorAttributeName: textColor ]
        
        let aText = NSAttributedString(string: text, attributes: textAttributes)

        return withAdded(text: aText)
    }
    
    public func withAdded(
        text: NSAttributedString,
        alignent: CGPoint = CGPoint(x: 0.5, y: 0.5)) -> UIImage
    {
        UIGraphicsBeginImageContextWithOptions(size, !hasAlpha, 0)
        
        defer { UIGraphicsEndImageContext() }
        
        draw(at: CGPoint.zero)
        
        let x = (0, size.width - text.size().width) ◊ alignent.x
        
        let y = (0, (size.height - text.size().height)) ◊ alignent.y
        
        text.draw(at: CGPoint(x: x, y: y))
        
        return UIGraphicsGetImageFromCurrentImageContext()!
    }
}
