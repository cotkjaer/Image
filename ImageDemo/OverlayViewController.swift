//
//  OverlayViewController.swift
//  Image
//
//  Created by Christian Otkjær on 06/03/17.
//  Copyright © 2017 Christian Otkjær. All rights reserved.
//

import UIKit
import Image

class OverlayViewController: UIViewController
{
    var color = UIColor(hue: 0.5, saturation: 0.8, brightness: 0.7, alpha: 1)

    @IBOutlet weak var originalImageView: UIImageView!
    
    @IBOutlet weak var overlayedImageView: UIImageView!
 
    @IBOutlet weak var hueSlider: UISlider!
    
    // MARK : Lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        updateImage()
    }

    
    // MARK: - Update
    
    
    @IBAction func handleSlider(_ slider: UISlider)
    {
        color = UIColor(hue: CGFloat(slider.value), saturation: 0.8, brightness: 0.7, alpha: 1)
        
        updateImage()
    }
    
    
    func updateImage()
    {
        overlayedImageView.image = originalImageView.image?.overlay(color: color)
    }
}
