//
//  ForgotPasswordViewControler.swift
//  Travel(app)
//
//  Created by anzori  on 2/9/23.
//  Copyright © 2023 anzori . All rights reserved.
//

import UIKit

class ForgotPasswordViewControler: UIViewController {
    //image
    @IBOutlet private weak var onImageView: UIView!
    //TextFields
    @IBOutlet private weak var emailField: UITextField!
    //buttons
    @IBOutlet private weak var sendCode_button: UIButton!
    //stackViews
    @IBOutlet private weak var stackView: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //gradiant
        ViewtopGradiant(imageTopView: onImageView)
        // borders
        addBottomBorder(to: stackView)
        emailField.borderStyle = .none
        //corner radius
        BorderRadius(to: sendCode_button)
    }

    @IBAction func SendCode(_ sender: Any) {
        let vc = UIStoryboard(name: "VerifyViewControler", bundle: nil).instantiateViewController(identifier: "VerifyViewControler") as! VerifyViewControler
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
