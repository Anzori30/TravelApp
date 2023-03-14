//
//  textFieldautoChangeColor.swift
//  Travel(app)
//
//  Created by macbook on 11.03.23.
//  Copyright © 2023 anzori . All rights reserved.
//
import UIKit

class textFieldautoChangeColor: UITextField {
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        color()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder:coder)
        color()
    }
    func color() {
        layer.cornerRadius = frame.height / 2
        let defaults = UserDefaults.standard
         let savedColor = defaults.string(forKey: "backgroundColor") ?? "white"
        if savedColor == "0" {
            backgroundColor =  UIColor(named: "ButtonColor_Green")!
        }
        else if savedColor == "1" {
            backgroundColor =  UIColor(named: "ButtonColor_Yelow")!
        }
        else {
            if HomeViewControler().traitCollection.userInterfaceStyle == .dark || LogInViewControler().traitCollection.userInterfaceStyle == .dark {
                backgroundColor =  UIColor(named: "ButtonColor_Green")!
               } else {
                   backgroundColor =  UIColor(named: "ButtonColor_Yelow")!
            }
        }
        
    }
}
