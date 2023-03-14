//
//  ButtonColorStyle.swift
//  Travel(app)
//
//  Created by macbook on 10.03.23.
//  Copyright © 2023 anzori . All rights reserved.
//

import UIKit

class ButtonColorStyle: UIButton {
    static var color = String()
    static func selectedColor() -> UIColor {
        return UIColor(named: color)!
      }
    override init(frame: CGRect) {
        super.init(frame: frame)
        button()
        border()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder:coder)
        button()
        border()
    }
    func button() {
        layer.cornerRadius = frame.height / 3
        let defaults = UserDefaults.standard
         let savedColor = defaults.string(forKey: "backgroundColor") ?? "white"
        if savedColor == "0" {
            backgroundColor =  UIColor(named: "ButtonColor_Green")!
            ButtonColorStyle.color = "ButtonColor_Green"
        }
        else if savedColor == "1" {
            backgroundColor =  UIColor(named: "ButtonColor_Yelow")!
            ButtonColorStyle.color  =   "ButtonColor_Yelow"
        }
        else {
            if HomeViewControler().traitCollection.userInterfaceStyle == .dark || LogInViewControler().traitCollection.userInterfaceStyle == .dark {
                backgroundColor =  UIColor(named: "ButtonColor_Green")!
                ButtonColorStyle.color = "ButtonColor_Green"
               } else {
                   backgroundColor =  UIColor(named: "ButtonColor_Yelow")!
                   ButtonColorStyle.color  = "ButtonColor_Yelow"
               }
        }
    }
    func border(){
     layer.borderWidth = 1.0
      layer.borderColor = UIColor(named: "ButtonColor_Orange")!.cgColor
    }
}

