//
//  UserInfoViewController.swift
//  Travel(app)
//
//  Created by macbook on 15.03.23.
//  Copyright © 2023 anzori . All rights reserved.
//

import UIKit

class UserInfoViewController:UIViewController{
    

    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func setImage(_ sender: Any) {
//        addImage()
    }
}
//extension UserInfoViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//    func addImage(){
//        let imagePickerController = UIImagePickerController()
//              imagePickerController.delegate = self
//              imagePickerController.sourceType = .photoLibrary
//              present(imagePickerController, animated: true, completion: nil)
//    }
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        // Get the image from the info dictionary
//        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
//            // Set the image on the button
//        }
//        // Dismiss the image picker
//        picker.dismiss(animated: true, completion: nil)
//    }
//
//}
