//
//  ImageTests.swift
//  ImageTests
//
//  Created by Christian Otkjær on 18/02/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

import XCTest
@testable import Image

class ImageTests: XCTestCase
{
    func test_linear_gradients()
    {
        let horizontal = UIImage.imageWithGradient(CGSize(width: 300, height: 100), startAnchor: CGPoint(x: 0,y: 0.5), endAnchor: CGPoint(x: 1, y: 0.5), colors: [UIColor(red: 0.9, green: 0.9, blue: 0.5, alpha: 1), UIColor(red: 0.2, green: 1, blue: 1, alpha: 1)])
        
        XCTAssertNotNil(horizontal)
        
        XCTAssertEqual(horizontal!.saveAs("png", baseFileName: "horizontal", folderPath: "/Users/cot/Desktop"), true)
        
        XCTAssertEqual(horizontal!.size, CGSize(width: 300, height: 100))
        
        
        let vertical = UIImage.imageWithGradient(CGSize(width: 100, height: 300), startAnchor: CGPoint(x: 0.5,y: 0), endAnchor: CGPoint(x: 0.5, y: 1), colors: [UIColor(red: 0.9, green: 0.9, blue: 0.5, alpha: 1), UIColor(red: 0.2, green: 1, blue: 1, alpha: 1)])
        
        XCTAssertNotNil(vertical)
        
        XCTAssertEqual(vertical!.saveAs("png", baseFileName: "vertical", folderPath: "/Users/cot/Desktop"), true)
        
        XCTAssertEqual(vertical!.size, CGSize(width: 100, height: 300))
        
        
        let diagonal = UIImage.imageWithGradient(CGSize(width: 300, height: 300), startAnchor: CGPoint(x: 0.1,y: 0.1), endAnchor: CGPoint(x: 0.5, y: 0.9), colors: [UIColor(red: 0.9, green: 0.9, blue: 0.5, alpha: 1), UIColor(red: 0.2, green: 1, blue: 1, alpha: 1)])
        
        XCTAssertNotNil(diagonal)
        
        XCTAssertEqual(diagonal!.saveAs("png", baseFileName: "diagonal", folderPath: "/Users/cot/Desktop"), true)
        
        XCTAssertEqual(diagonal!.size, CGSize(width: 300, height: 300))
    }
    
    func test_radial_gradient_default()
    {
        let centered = UIImage.imageWithRadialGradient(CGSize(width: 300, height: 200))
        
        XCTAssertNotNil(centered)
        
        XCTAssertEqual(centered!.saveAs("png", baseFileName: "centered", folderPath: "/Users/cot/Desktop"), true)
        
        XCTAssertEqual(centered!.size, CGSize(width: 300, height: 200))
    }
    
    func test_radial_gradient_colors()
    {
        let colors = UIImage.imageWithRadialGradient(CGSize(width: 300, height: 200), colors:[UIColor(red: 0.9, green: 0.9, blue: 0.5, alpha: 1), UIColor(red: 0.2, green: 1, blue: 1, alpha: 1)])
        
        XCTAssertNotNil(colors)
        
        XCTAssertEqual(colors!.saveAs("png", baseFileName: "colors", folderPath: "/Users/cot/Desktop"), true)
        
        XCTAssertEqual(colors!.size, CGSize(width: 300, height: 200))
    }
    
}
