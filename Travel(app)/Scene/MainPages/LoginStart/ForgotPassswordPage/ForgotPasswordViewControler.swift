//
//  ForgotPasswordViewControler.swift
//  Travel(app)
//
//  Created by anzori  on 2/9/23.
//  Copyright © 2023 anzori . All rights reserved.
//

import UIKit
import Firebase
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
        ViewtopGradiant(imageTopView: onImageView, mainView: view)
        // borders
        addBottomBorder(to: stackView)
    }

    @IBAction func SendCode(_ sender: Any){
        let auth = Auth.auth()
        auth.sendPasswordReset(withEmail: emailField.text!) { error in
            if let error = error{
                self.present(AlertController.creatalert(title: "", message: error.localizedDescription), animated: true)
            }
            self.present(AlertController.creatalert(title: "", message:"Recovery link sent successfully"), animated: true)
            self.emailField.text = ""
        }
        
    
    }
    
}
