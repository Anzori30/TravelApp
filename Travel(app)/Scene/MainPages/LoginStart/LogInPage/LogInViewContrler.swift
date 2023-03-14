//
//  LogInViewControler.swift
//  Travel(app)
//
//  Created by anzori  on 2/9/23.
//  Copyright © 2023 anzori . All rights reserved.
//


import UIKit
import Firebase

class LogInViewControler: UIViewController {
    //images
    @IBOutlet private weak var imageTopView: UIView!
    //stackViews
    @IBOutlet private weak var stack_Border: UIStackView!
    @IBOutlet private weak var starck2_Border: UIStackView!
    // textFields
    @IBOutlet weak var userName_textField: UITextField!
    @IBOutlet private weak var password_textField: UITextField!
    // buttons
    @IBOutlet private weak var faceId_Button: UIButton!
    @IBOutlet private weak var logIn_Button: UIButton!
    @IBOutlet private weak var apple_Button: UIButton!
    @IBOutlet private weak var google_Button: UIButton!
    @IBOutlet private weak var facebook_BUtton: UIButton!
    @IBOutlet private weak var saveInfo_button: UIButton!
    
    @IBOutlet weak var activity: UIActivityIndicatorView!
    
  
    @IBOutlet weak var lable: UILabel!
    
    var valueToSave = Bool()
    let defaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        // gradiants for view
        ViewtopGradiant(imageTopView: imageTopView, mainView: view)
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        // borders
        addBottomBorder(to: stack_Border)
        addBottomBorder(to: starck2_Border)
       

    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
   
    @IBAction func ForgotPasword(_ sender: Any) {
        let vc = UIStoryboard(name: "ForgotPasswordViewControler", bundle: nil).instantiateViewController(identifier: "ForgotPasswordViewControler") as! ForgotPasswordViewControler
            navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func On_Register(_ sender: Any) {
        let vc = UIStoryboard(name: "RegistrationViewControler", bundle: nil).instantiateViewController(identifier: "RegistrationViewControler") as! RegistrationViewControler
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func Login_button(_ sender: Any) {

        activity.startAnimating()
        signInWithEmail(email: userName_textField.text!, password: password_textField.text!)
        }
    
    
    @IBAction func on_saveInfo(_ sender: UIButton) {
       
        if sender.isSelected{
            sender.isSelected = false
        }
        else{
            sender.isSelected = true
        }
    }
}
extension LogInViewControler{
    func signInWithEmail(email: String, password: String) {
        
        let auth = Auth.auth()

        auth.signIn(withEmail: email, password: password) { authResult, error in

                if error != nil{
                    if let error = error as NSError? {
                        if error.code == AuthErrorCode.emailAlreadyInUse.rawValue {
                            self.present(AlertController.creatalert(title: "Username or password is incorrect", message: ""), animated: true)
                            
                        }
                        else {
                            self.present(AlertController.creatalert(title: "", message: error.localizedDescription), animated: true)
                          
                        }
                    }
                }

            //user name
            if let user = authResult?.user {
               let displayName = user.displayName ?? "Unknown"
                UserDefaults.standard.set(displayName, forKey: "myKey")
             }
//                let vc = UIStoryboard(name: "VerifyViewControler", bundle: nil).instantiateViewController(identifier: "VerifyViewControler") as! VerifyViewControler
//                self.navigationController?.pushViewController(vc, animated: true)
            if self.saveInfo_button.isSelected{
                self.valueToSave = true
                self.defaults.set(self.valueToSave, forKey: "isLogined")
            }
            else{
                self.valueToSave = false
                self.defaults.set(self.valueToSave, forKey: "isLogined")
            }
            self.defaults.synchronize()
            self.activity.stopAnimating()
            let vc = UIStoryboard(name: "TabBarViewControler", bundle: nil).instantiateViewController(identifier: "TabBarViewControler") as! TabBarViewControler
            self.navigationController?.pushViewController(vc, animated: true)
            self.password_textField.text = ""
            }

        
        }
    
    
    }


