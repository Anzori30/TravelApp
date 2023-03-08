//
//  AlertController.swift
//  Travel(app)
//
//  Created by macbook on 07.03.23.
//  Copyright © 2023 anzori . All rights reserved.
//

import UIKit

class AlertController{
    static func creatalert(title: String, message:String) -> UIAlertController{
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ok", style: .default) { action in
            alert.dismiss(animated: true ,completion: nil)
        }
        alert.addAction(okAction)
        return alert
    }
}
