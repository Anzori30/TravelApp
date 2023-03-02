//
//  RegistrationViewControler.swift
//  Travel(app)
//
//  Created by anzori  on 2/14/23.
//  Copyright © 2023 anzori . All rights reserved.
//

import UIKit

class RegistrationViewControler: UIViewController {
    // images
    @IBOutlet weak var onImageView: UIView!
    //Buttons
    @IBOutlet private weak var registerButton: UIButton!
    //textFields
    @IBOutlet private weak var firstnameTextField: UITextField!
    @IBOutlet weak var lastnameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var repeatPasswordTextField: UITextField!
    // stackViews
    @IBOutlet weak var stack_view1: UIStackView!
    @IBOutlet weak var stack_view2: UIStackView!
    @IBOutlet weak var stack_view3: UIStackView!
    @IBOutlet weak var stack_view4: UIStackView!
    @IBOutlet weak var stack_view5: UIStackView!
    @IBOutlet weak var stack_view6: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         //gradiants
          ViewtopGradiant(imageTopView: onImageView)
          // bottom borders
          addBottomBorder(to: stack_view1)
          addBottomBorder(to: stack_view2)
          addBottomBorder(to: stack_view3)
          addBottomBorder(to: stack_view4)
          addBottomBorder(to: stack_view5)
          addBottomBorder(to: stack_view6)
    }
}
