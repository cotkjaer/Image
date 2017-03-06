//
//  ImageTests.swift
//  ImageTests
//
//  Created by Christian Otkjær on 18/02/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

import XCTest
@testable import Image
import Graphics

class ImageTests: XCTestCase
{
    func test_linear_gradients()
    {
        var colors = [UIColor(red: 0.9, green: 0.9, blue: 0.5, alpha: 1), UIColor(red: 0.2, green: 1, blue: 1, alpha: 1)]
        
        var size = CGSize(width: 300, height: 100)
        
        let horizontal = UIImage(linearGradientOfSize: size, startAnchor: CGPoint(x: 0,y: 0.5), endAnchor: CGPoint(x: 1, y: 0.5), colors: colors)
        
        XCTAssertNotNil(horizontal)
        
        XCTAssertEqual(horizontal!.saveAs("png", baseFileName: "horizontal", folderPath: "/Users/cot/Desktop"), true)
        
        XCTAssertEqual(horizontal!.size, size * UIScreen.main.scale)
        
        colors.append(UIColor(red: 0.5, green: 0.1, blue: 0.5, alpha: 0.5))
        
        size = CGSize(width: 100, height: 300)
        
        let vertical = UIImage(linearGradientOfSize: size, startAnchor: CGPoint(x: 0.5,y: 0), endAnchor: CGPoint(x: 0.5, y: 1), colors: colors)
        
        XCTAssertNotNil(vertical)
        
        XCTAssertEqual(vertical!.saveAs("png", baseFileName: "vertical", folderPath: "/Users/cot/Desktop"), true)
        
        XCTAssertEqual(vertical!.size, size * UIScreen.main.scale)
        
        size = CGSize(width: 300, height: 300)
        
        colors.append(UIColor(red: 1, green: 0.1, blue: 0.95, alpha: 0.1))
        
        let diagonal = UIImage(linearGradientOfSize: size, startAnchor: CGPoint(x: 0.1,y: 0.1), endAnchor: CGPoint(x: 0.5, y: 0.9), colors: colors)
        
        XCTAssertNotNil(diagonal)
        
        XCTAssertEqual(diagonal!.saveAs("png", baseFileName: "diagonal", folderPath: "/Users/cot/Desktop"), true)
        
        XCTAssertEqual(diagonal!.size, size * UIScreen.main.scale)
    }
    
    func test_radial_gradient_default()
    {
        let size = CGSize(width: 300, height: 200)
        
        let centered = UIImage(radialGradientOfSize: size)

        XCTAssertNotNil(centered)
        
        XCTAssertEqual(centered!.saveAs("png", baseFileName: "centered", folderPath: "/Users/cot/Desktop"), true)
        
        XCTAssertEqual(centered!.size, size * UIScreen.main.scale)
    }
    
    func test_radial_gradient_colors()
    {
        let size = CGSize(width: 300, height: 200)

        let colors = UIImage(data: size, scale:[UIColor(red: 0.9, green: 0.9, blue: 0.5, alpha: 1), UIColor(red: 0.2, green: 1, blue: 1, alpha: 1)])
        
        XCTAssertNotNil(colors)
        
        XCTAssertEqual(colors!.saveAs("png", baseFileName: "colors", folderPath: "/Users/cot/Desktop"), true)
        
        XCTAssertEqual(colors!.size, size * UIScreen.main.scale)
    }
    
}
