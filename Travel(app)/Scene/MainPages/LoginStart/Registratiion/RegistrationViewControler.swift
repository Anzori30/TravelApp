//
//  RegistrationViewControler.swift
//  Travel(app)
//
//  Created by anzori  on 2/14/23.
//  Copyright © 2023 anzori . All rights reserved.
//

import UIKit
import Firebase
import LocalAuthentication
class RegistrationViewControler: UIViewController {
    var ViewSize = Int()
    // images
    @IBOutlet private weak var onImageView: UIView!
    //Buttons
    @IBOutlet private weak var registerButton: UIButton!
    //textFields
    @IBOutlet private weak var lastnameTextField: UITextField!
    @IBOutlet private weak var repeatPassword: UITextField!
    @IBOutlet private  weak var emailTextField: UITextField!
    @IBOutlet private  weak var passwordTextField: UITextField!
    // stackViews
    @IBOutlet private weak var stack_view2: UIStackView!
    @IBOutlet private weak var stack_view3: UIStackView!
    @IBOutlet private weak var stack_view4: UIStackView!
    @IBOutlet private weak var stack_view5: UIStackView!
    @IBOutlet private weak var mainSteck: UIStackView!
    

    // Add this to viewDidLoad()
    let scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
         //gradiants
        ViewtopGradiant(imageTopView: onImageView, mainView: view)
          // bottom borders
          addBottomBorder(to: stack_view2)
          addBottomBorder(to: stack_view3)
          addBottomBorder(to: stack_view4)
          addBottomBorder(to: stack_view5)
        registerForKeyboardNotifications()
    }
    func registerForKeyboardNotifications() {
           NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
           NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
       }
    @objc func keyboardWillShow(notification: NSNotification) {
            if let userInfo = notification.userInfo,
                let keyboardSize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
                self.scrollView.contentInset = contentInsets
                self.scrollView.scrollIndicatorInsets = contentInsets
            }
        }

        @objc func keyboardWillHide(notification: NSNotification) {
            let contentInsets = UIEdgeInsets.zero
            self.scrollView.contentInset = contentInsets
            self.scrollView.scrollIndicatorInsets = contentInsets
        }
    
    @IBAction func on_SignUp(_ sender: Any) {
        if lastnameTextField.text != "" {
            if passwordTextField.text == repeatPassword.text  {
                       registerUser(email: emailTextField.text!, password: passwordTextField.text!)
                   }
            else{
                self.present(AlertController.creatalert(title: "", message: "Passwords do not match"), animated: true)
            }
        }
        else{
            self.present(AlertController.creatalert(title: "", message: "Pleas fill name field"), animated: true)
        }
        
    }

    
}

extension RegistrationViewControler{
    
    func registerUser(email: String, password: String) {
        
        let auth = Auth.auth()
        auth.createUser(withEmail: email, password: password) { authResult, error in
            
            if let error = error as NSError? {
                if error.code == AuthErrorCode.emailAlreadyInUse.rawValue {
                    self.present(AlertController.creatalert(title: "", message: "The email address is already in use by another account."), animated: true)
                }
                else {
                    self.present(AlertController.creatalert(title: "", message: error.localizedDescription), animated: true)
                }
            }
            else {
                let alert = UIAlertController(title: "You have successfully registered", message: "Go LogIn?", preferredStyle: .alert)
                let cancel = UIAlertAction(title: "cancel", style: .default) { action in
                    alert.dismiss(animated: true ,completion: nil)
                    self.passwordTextField.text = ""
                    self.emailTextField.text = ""
                    self.lastnameTextField.text = ""
                    self.repeatPassword.text = ""
                }
                let okAction = UIAlertAction(title: "ok", style: .default) { action in
                    self.navigationController?.popViewController(animated: true)
                }
                alert.addAction(cancel)
                alert.addAction(okAction)
                self.present(alert, animated: true)
            }
          
            let changeRequest = authResult?.user.createProfileChangeRequest()
            changeRequest?.displayName = self.lastnameTextField.text!
            changeRequest?.commitChanges { error in
                if let error = error {
                    
                    self.present(AlertController.creatalert(title: "", message: "Error setting display name: \(error.localizedDescription)"), animated: true)
                    
                    return
                }
            
            }
        }
    }

    
}
