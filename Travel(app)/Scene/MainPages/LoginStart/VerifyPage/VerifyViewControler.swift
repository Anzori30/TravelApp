//
//  VerifyViewControler.swift
//  Travel(app)
//
//  Created by anzori  on 2/9/23.
//  Copyright © 2023 anzori . All rights reserved.
//
import UIKit

class VerifyViewControler: UIViewController {
    //images
    @IBOutlet weak var onImageView: UIView!
    //buttons
    @IBOutlet private weak var verifyButton: UIButton!
    //textFields
    @IBOutlet private weak var TextField1: UITextField!
    @IBOutlet private weak var TextField2: UITextField!
    @IBOutlet private weak var TextField3: UITextField!
    @IBOutlet private weak var TextField4: UITextField!
    
    override func viewDidLoad() {
    //gradiants
    ViewtopGradiant(imageTopView: onImageView)
    // button border
    textField(to: TextField1)
    textField(to: TextField2)
    textField(to: TextField3)
    textField(to: TextField4)
    }
  
    
}
