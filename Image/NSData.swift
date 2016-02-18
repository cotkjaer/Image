//
//  NSData.swift
//  Silverback
//
//  Created by Christian Otkjær on 15/02/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

import Foundation

//MARK: - Image

extension NSData
{
    public var asImage : UIImage? { return UIImage(data: self) }
}

