//
//  TextViewController.swift
//  Image
//
//  Created by Christian Otkjær on 06/03/17.
//  Copyright © 2017 Christian Otkjær. All rights reserved.
//

import UIKit
import Image

class TextViewController: UIViewController, UITextFieldDelegate
{

    @IBOutlet weak var originalImageView: UIImageView!
    @IBOutlet weak var modifiedImageView: UIImageView!
  
    @IBOutlet weak var textField: UITextField!

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason)
    {
        updateImage()
    }
    
    func updateImage()
    {
        modifiedImageView.image = originalImageView.image?.withAdded(text: textField.text)
    }
    
}

