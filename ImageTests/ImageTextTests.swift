//
//  ImageTextTests.swift
//  Image
//
//  Created by Christian Otkjær on 21/07/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

import XCTest
import UIKit
@testable import Image

class ImageTextTests: XCTestCase
{
    func test_text()
    {
        guard let font = UIFont(name: "Arial", size: 96) else { XCTFail("No font"); return }
        
        let imageA = UIImage(text: "A", textFont: font, textColor: UIColor.orange)
        
        XCTAssertNotNil(imageA)
        XCTAssertEqual(imageA?.saveAs("png", baseFileName: "A", folderPath: "/Users/cot/Desktop"), true)
        
        let imageAB = imageA?.imageWithAddedText("B", textFont: font, textColor:  UIColor.green)
        
        XCTAssertNotNil(imageAB)
        XCTAssertEqual(imageAB?.saveAs("png", baseFileName: "AB", folderPath: "/Users/cot/Desktop"), true)
        
    }

}
