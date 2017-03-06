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
    
    @IBOutlet weak var hueLabel: UILabel!
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
        let hue = CGFloat(slider.value * 100) / 100
        
        color = UIColor(hue: hue, saturation: 0.8, brightness: 0.7, alpha: 1)
        
        updateImage()
        
        hueLabel.text = String(format: "%0.2f", hue)
    }
    
    
    func updateImage()
    {
        overlayedImageView.image = originalImageView.image?.blendedWith(color: color)
    }
}
