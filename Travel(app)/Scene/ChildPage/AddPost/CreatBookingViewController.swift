//
//  CreatBookingViewController.swift
//  Travel(app)
//
//  Created by macbook on 11.03.23.
//  Copyright © 2023 anzori . All rights reserved.
//

import UIKit
import FirebaseStorage
import Firebase
import FirebaseFirestore
class CreatBookingViewController: UIViewController{
    
    @IBOutlet private weak var name_Field: textFieldautoChangeColor!
    @IBOutlet private weak var description_field: UITextField!
    @IBOutlet private weak var priceTextField: textFieldautoChangeColor!
    @IBOutlet private weak var price_labe: UILabel!
    @IBOutlet private weak var collection: UICollectionView!
    @IBOutlet private weak var spiner: UIActivityIndicatorView!
    @IBOutlet private weak var Button1: UIButton!
    @IBOutlet private weak var Button2: UIButton!
    @IBOutlet private weak var Button3: UIButton!
    @IBOutlet private weak var Button4: UIButton!
    @IBOutlet private var main_view: UIView!
    @IBOutlet private weak var slider_value: UILabel!
    @IBOutlet private weak var slider: UISlider!
    @IBOutlet private weak var star_slider_lable: UILabel!
    @IBOutlet private weak var star_slider: UISlider!

    @IBOutlet weak var hide_all: UIView!

    
    var downloadURLStrings = [String]()
    var buttons: [UIButton] = []
    var starInt = Int()
    var personInt = Int()
    var user:[User] = []
    var selectedImages: [ImageUrl] = []
    var typeName = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        slider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
        star_slider.addTarget(self, action: #selector(star_sliderValueChanged), for: .valueChanged)
        textFieldNumber()
        buttons = [Button1, Button2, Button3, Button4]
        collection.register(UINib(nibName: "CeratBookingCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CeratBookingCollectionViewCell")
        collection.dataSource = self
        collection.delegate = self
    }
   

    // Firestore
    let firestoreRef = Firestore.firestore()

    func saveUserInfo(users: [User]) {
        guard let currentUserID = Auth.auth().currentUser?.uid else {
            return
        }
        guard let email = Auth.auth().currentUser?.email?.replacingOccurrences(of: ".", with: "-").replacingOccurrences(of: "@", with: "-") else {
            return
        }

        let userRef = firestoreRef.collection("users").document(currentUserID)
        var userDicts: [[String: Any]] = []
        for user in users {
            userDicts.append(user.toDictionary())
        }

        userRef.getDocument { (document, error) in
            if let document = document, document.exists {
                var oldUserDicts = document.data()?["users"] as? [[String: Any]] ?? []
                oldUserDicts.append(contentsOf: userDicts)
                userRef.updateData(["users": oldUserDicts])
                self.present(AlertController.creatalert(title: "", message: "Upload successfully" ), animated: true)
            } else {
                userRef.setData(["email": email, "users": userDicts, "userID": currentUserID]) { error in
                 
                    if let error = error {
                        self.present(AlertController.creatalert(title: "", message: "Error adding document: \(error.localizedDescription)"), animated: true)
                    } else {
                        print("Document added with ID: \(userRef.documentID)")
                    }
                }
            }
        }
    }



    func uploadPhotos(_ photos: [ImageUrl]) {
        let storageRef = Storage.storage().reference()

        for (index, photo) in photos.enumerated() {
            guard let imageData = photo.image.jpegData(compressionQuality: 0.75) else {
                print("Error: Could not convert photo to JPEG data")
                self.present(AlertController.creatalert(title: "", message: "try later"), animated: true)
                continue
            }

            let photoRef = storageRef.child("photos/\(index).jpg")

            photoRef.putData(imageData, metadata: nil) { (metadata, error) in
                if let error = error {
                    print("Error uploading photo: \(error.localizedDescription)")
                    self.present(AlertController.creatalert(title: "", message: "Error uploading photo: \(error.localizedDescription)"), animated: true)
                    return
                }

                photoRef.downloadURL { [self] (url, error) in
                    if let error = error {
                        self.present(AlertController.creatalert(title: "", message: "Error getting download URL:\(error.localizedDescription)"), animated: true)
                        return
                    }

                    if let downloadURL = url {
                        downloadURLStrings.append(downloadURL.absoluteString)
                        if downloadURLStrings.count == photos.count {
                            start(downloadURLStrings)
                        }
                    }
                }
            }
        }
    }

    func start(_ downloadURLStrings: [String]) {
        let photoDict = ["url": downloadURLStrings]
        user.append(User(name: name_Field.text!, photo: photoDict, location: "Tbilisi", description: description_field.text!, type: typeName, star: starInt, price: priceTextField.text!, person: personInt))
        saveUserInfo(users: user)
        self.downloadURLStrings = []
        selectedImages = []
        collection.reloadData()
        spiner.stopAnimating()
        hide_all.isHidden = true
    }

    override func viewWillAppear(_ animated: Bool) {
        bacgroundColor(view: view)
    }
    @IBAction func on_Type(_ sender: UIButton) {
        buttons.forEach { button in
            if button.tag != sender.tag {
                button.isSelected = false
                button.backgroundColor = UIColor.clear
            }
        }
        sender.isSelected = true
        typeName = sender.titleLabel!.text!
        print(sender.titleLabel!.text!)
        sender.backgroundColor = ButtonColorStyle.selectedColor()
    }
    @IBAction func addImage(_ sender: Any) {
        addImage()
    }
    @IBAction func On_Post(_ sender: Any) {
        if !selectedImages.isEmpty{
            if name_Field.text != "" && description_field.text != "" && price_labe.text != ""{
                spiner.startAnimating()
                uploadPhotos(selectedImages)
                hide_all.isHidden = false
            }
            else{
                self.present(AlertController.creatalert(title: "", message: "Please fill all field"), animated: true)
            }
        }
        else{
            self.present(AlertController.creatalert(title: "", message: "Please select image"), animated: true)
        }
    
    }
    
}


extension CreatBookingViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func addImage(){
        let imagePickerController = UIImagePickerController()
              imagePickerController.delegate = self
              imagePickerController.sourceType = .photoLibrary
              present(imagePickerController, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        collection.reloadData()
    
          if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
              selectedImages.append(ImageUrl(image: image))
             
          }
          dismiss(animated: true, completion: nil)
      }

}

//colectiobview

extension CreatBookingViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        selectedImages.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "CeratBookingCollectionViewCell", for: indexPath)  as! CeratBookingCollectionViewCell
        cell.configure(with: selectedImages[indexPath.row])
        cell.deleteButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return cell
    }
    @objc func buttonTapped(sender: UIButton) {
         if let cell = sender.superview?.superview as? CeratBookingCollectionViewCell,
            let indexToDelete = collection.indexPath(for: cell)?.row {
             selectedImages.remove(at: indexToDelete)
             collection.reloadData()
         }
     }

}
extension CreatBookingViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = 150
        let itemHeight = 150
        return CGSize(width: itemWidth, height: itemHeight)
        }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    
}


//textfied

extension CreatBookingViewController: UITextFieldDelegate{
    func textFieldNumber(){
        priceTextField.delegate = self
        priceTextField.keyboardType = .numberPad
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
          let allowedCharacters = CharacterSet.decimalDigits
          let characterSet = CharacterSet(charactersIn: string)
          return allowedCharacters.isSuperset(of: characterSet)
      }
}

///extension

extension CreatBookingViewController{
    @objc func star_sliderValueChanged() {
        // Limit the slider value to be between 0 and 30
        let value = max(min(Int(star_slider.value), 30), 1)
        
        // Update the slider value
        star_slider.value = Float(value)
        
        // Update the label text with the new value
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        star_slider_lable.text = formatter.string(from: NSNumber(value: value))! + " Star"
        starInt = Int(truncating: NSNumber(value: value))
        // Calculate the position of the label based on the slider value
        let sliderRange = star_slider.frame.size.width - star_slider.currentThumbImage!.size.width
        let sliderOrigin = star_slider.frame.origin.x - star_slider.currentThumbImage!.size.width
        let labelX = sliderOrigin + (CGFloat(value) * sliderRange / CGFloat(star_slider.maximumValue))
        let labelY = star_slider.frame.origin.y - star_slider.frame.size.height
        let labelWidth = star_slider_lable.frame.size.width
        let labelHeight = star_slider_lable.frame.size.height
        
        // Set the position of the label
        star_slider_lable.frame = CGRect(x: labelX, y: labelY, width: labelWidth, height: labelHeight)
    }

    
    @objc func sliderValueChanged() {
        // Limit the slider value to be between 0 and 30
        let value = max(min(Int(slider.value), 30), 1)
        
        // Update the slider value
        slider.value = Float(value)
        
        // Update the label text with the new value
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        slider_value.text = formatter.string(from: NSNumber(value: value))! + " Person"
        personInt = Int(truncating: NSNumber(value: value))
        // Calculate the position of the label based on the slider value
        let sliderRange = slider.frame.size.width - slider.currentThumbImage!.size.width
        let sliderOrigin = slider.frame.origin.x
        let labelX = sliderOrigin + (CGFloat(value) * sliderRange / CGFloat(slider.maximumValue))
        let labelY = slider.frame.origin.y - slider_value.frame.size.height
        let labelWidth = slider_value.frame.size.width
        let labelHeight = slider_value.frame.size.height
        
        // Set the position of the label
        slider_value.frame = CGRect(x: labelX, y: labelY, width: labelWidth, height: labelHeight)
    }
}
