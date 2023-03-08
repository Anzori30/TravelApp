//
//  VerifyViewControler.swift
//  Travel(app)
//
//  Created by anzori  on 2/9/23.
//  Copyright © 2023 anzori . All rights reserved.
//
import UIKit
import Firebase
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
        ViewtopGradiant(imageTopView: onImageView, mainView: view)
    // button border
    textField(to: TextField1)
    textField(to: TextField2)
    textField(to: TextField3)
    textField(to: TextField4)
        
        
//        let alert = UIAlertController(title: "Verify Email", message: "Please enter the verification code sent to your email.", preferredStyle: .alert)
//
//           alert.addTextField { (textField) in
//             textField.placeholder = "Verification Code"
    }
//        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
//
//            alert.addAction(UIAlertAction(title: "Verify", style: .default, handler: { [weak alert] (_) in
//              let verificationCode = alert?.textFields![0].text
//              let user = Auth.auth().currentUser
//              let credential = EmailAuthProvider.credential(withEmail: "anzoriqiziyelashvili11@gmail.com", password: verificationCode!)
//
//              // Authenticating the user with the verification code.
//              user?.reauthenticate(with: credential, completion: { (authResult, error) in
//                if let error = error {
//                  print("Error authenticating user with verification code: \(error.localizedDescription)")
//                } else {
//                  print("User successfully authenticated with verification code.")
//
//                  // User is authenticated with two-factor authentication, you can perform any additional actions here.
//                }
//              })
//            }))
//
//            self.present(alert, animated: true, completion: nil)
//          }
    
}
