//
//  UIImage+Save.swift
//  Image
//
//  Created by Christian Otkjær on 06/03/17.
//  Copyright © 2017 Christian Otkjær. All rights reserved.
//

import UIKit

// MARK: - Save

extension UIImage
{
    private class func documentDirectoryPath() -> String?
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
