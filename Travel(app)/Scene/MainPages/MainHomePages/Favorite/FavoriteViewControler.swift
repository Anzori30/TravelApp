//
//  FavoriteViewControler.swift
//  Travel(app)
//
//  Created by anzori  on 2/18/23.
//  Copyright © 2023 anzori . All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class FavoriteViewControler: UIViewController {
//    let databaseRef = Database.database().reference()
//
//    func saveUserInfo(users: [User]) {
//        guard let currentUserID = Auth.auth().currentUser?.uid else {
//            return
//        }
//        guard let email = Auth.auth().currentUser?.email?.replacingOccurrences(of: ".", with: "-").replacingOccurrences(of: "@", with: "-") else {
//            return
//        }
//        
//        let userRef = databaseRef.child("users").child(email).child(currentUserID)
//        let userDicts = users.map { $0.toDictionary() }
//        userRef.setValue(userDicts) { error, _ in
//            if let error = error {
//                print("Error saving user info: \(error.localizedDescription)")
//            } else {
//                print("User info saved successfully.")
//            }
//        }
//    }
//    


    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //bacground color
        bacgroundColor(view: view)
    }
    
    @IBAction func addelement(_ sender: Any) {
//        let users = [
//        User(name: "anzori", photo: ["sdfsdsdf","fdsafssdf","sdasdada"], location: "ssadadas", description: "adasdasda", rating: 5),
//        User(name: "anzori", photo: ["sdfsdsdf","fdsafssdf","sdasdada"], location: "ssadadas", description: "adasdasda", rating: 5),
//        User(name: "anzori", photo: ["sdfsdsdf","fdsafssdf","sdasdada"], location: "ssadadas", description: "adasdasda", rating: 5)
//        ]
//        saveUserInfo(users: users)
    }
    
    @IBAction func on_delete(_ sender: Any) {
        // Handle delete button action here
    }
}


