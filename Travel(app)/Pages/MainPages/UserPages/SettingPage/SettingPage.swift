//
//  SettingPage.swift
//  Travel(app)
//
//  Created by anzori  on 2/23/23.
//  Copyright © 2023 anzori . All rights reserved.
//

import UIKit

class SettingPage: UIViewController {
    
    let defaults = UserDefaults.standard
     var hasBackgroundColorChanged = false
    @IBOutlet weak var saveButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        //bacground color
        bacgroundColor(view: view)
        //corner radius
        BorderRadius(to: saveButton)
    }
 
    @IBAction func colorControl(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            view.backgroundColor = UIColor(red: 0.106, green: 0.196, blue: 0.196, alpha: 1)
             defaults.set("0", forKey: "backgroundColor")
            sender.selectedSegmentTintColor = .red
             hasBackgroundColorChanged = true
        case 1:
            view.backgroundColor = UIColor(red: 0.992, green: 0.91, blue: 0.816, alpha: 1)
            defaults.set("1", forKey: "backgroundColor")
             hasBackgroundColorChanged = true
        case 2:
            view.backgroundColor = UIColor.systemBackground
            defaults.set("2", forKey: "backgroundColor")
            hasBackgroundColorChanged = true
        default :
            break
        }
    }
    
    @IBAction func save_button(_ sender: Any) {
        
        if  hasBackgroundColorChanged {
             navigationController?.popViewController(animated: true)
        }
        else{
          let alert = UIAlertController(title: "Warning", message: "Please change something or return back page", preferredStyle: .alert)
            let returns = UIAlertAction(title: "Return", style: .default) { (action) in
                self.navigationController?.popViewController(animated: true)
            }
            let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
                
            }
            alert.addAction(returns)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
       
    }
    
}
