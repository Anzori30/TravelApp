//
//  LogInViewControler.swift
//  Travel(app)
//
//  Created by anzori  on 2/9/23.
//  Copyright © 2023 anzori . All rights reserved.
//


import UIKit

class LogInViewControler: UIViewController {
    //images
    @IBOutlet private weak var imageTopView: UIView!
    //stackViews
    @IBOutlet private weak var stack_Border: UIStackView!
    @IBOutlet private weak var starck2_Border: UIStackView!
    // textFields
    @IBOutlet private weak var userName_textField: UITextField!
    @IBOutlet private weak var password_textField: UITextField!
    // buttons
    @IBOutlet private weak var faceId_Button: UIButton!
    @IBOutlet private weak var logIn_Button: UIButton!
    @IBOutlet private weak var apple_Button: UIButton!
    @IBOutlet private weak var google_Button: UIButton!
    @IBOutlet private weak var facebook_BUtton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // gradiants for view
        ViewtopGradiant(imageTopView: imageTopView)
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        // borders
        addBottomBorder(to: stack_Border)
        addBottomBorder(to: starck2_Border)
        userName_textField.borderStyle = .none
        password_textField.borderStyle = .none
        //corner radius
        BorderRadius(to: logIn_Button)
        BorderRadius(to: faceId_Button)
        BorderRadius(to: apple_Button)
        BorderRadius(to: google_Button)
        BorderRadius(to: facebook_BUtton)
    }
    
    @IBAction func ForgotPasword(_ sender: Any) {
        let vc = UIStoryboard(name: "ForgotPasswordViewControler", bundle: nil).instantiateViewController(identifier: "ForgotPasswordViewControler") as! ForgotPasswordViewControler
                      navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func Login_button(_ sender: Any) {
        let vc = UIStoryboard(name: "VerifyViewControler", bundle: nil).instantiateViewController(identifier: "VerifyViewControler") as! VerifyViewControler
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func On_Register(_ sender: Any) {
        let vc = UIStoryboard(name: "RegistrationViewControler", bundle: nil).instantiateViewController(identifier: "RegistrationViewControler") as! RegistrationViewControler
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
