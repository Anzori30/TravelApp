//
//  Appstyle.swift
//  Travel(app)
//
//  Created by anzori  on 2/9/23.
//  Copyright © 2023 anzori . All rights reserved.
//
import UIKit
func tabBarColor(tab:UITabBar){
    let defaults = UserDefaults.standard
     let savedColor = defaults.string(forKey: "backgroundColor") ?? "white"
     if savedColor == "0"{
        tab.barTintColor = UIColor(red: 0.106, green: 0.196, blue: 0.196, alpha: 1)
     }
     else if savedColor == "1"{
         tab.barTintColor = UIColor(red: 0.992, green: 0.91, blue: 0.816, alpha: 1)
     }
     else{
         tab.barTintColor = UIColor.systemBackground
     }
}

func bacgroundColor(view:UIView){
    let defaults = UserDefaults.standard
    let savedColor = defaults.string(forKey: "backgroundColor") ?? "white"
    if savedColor == "0"{
        view.backgroundColor = UIColor(red: 0.106, green: 0.196, blue: 0.196, alpha: 1)
    }
    else if savedColor == "1"{
        view.backgroundColor = UIColor(red: 0.992, green: 0.91, blue: 0.816, alpha: 1)
    }
    else{
        view.backgroundColor = UIColor.systemBackground
    }
  
}


// border Bottom
func addBottomBorder(to stackView: UIStackView, color: UIColor = .lightGray, width: CGFloat = 1.0) {
    let border = CALayer()
    border.backgroundColor = color.cgColor
    border.frame = CGRect(x: 0, y: stackView.frame.size.height - width, width: stackView.frame.size.width, height: width)
    stackView.layer.addSublayer(border)
}
// gradiand for View
func ViewtopGradiant(imageTopView:UIView!){
    let gradientLayer = CAGradientLayer()
    imageTopView.layer.cornerRadius = 40
    imageTopView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    gradientLayer.frame = imageTopView.bounds
    gradientLayer.colors = [UIColor.clear.cgColor, UIColor.init(red: 23/255, green: 43/255, blue: 43/255, alpha: 0.95).cgColor]
    gradientLayer.locations = [0.0, 0.177]
    gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
    gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
    imageTopView.layer.insertSublayer(gradientLayer, at: 0)
}

// corner radius
func BorderRadius(to button:UIButton){
    button.layer.cornerRadius = 20
}
func cornerRadiusUser(to button:UIButton){
    button.layer.cornerRadius = 15
}
//textfield BorderBottom
func textField(to stackView: UITextField, color: UIColor = .lightGray, width: CGFloat = 1.0) {
    let border = CALayer()
    border.backgroundColor = color.cgColor
    border.frame = CGRect(x: 0, y: stackView.frame.size.height - width, width: stackView.frame.size.width, height: width)
    stackView.layer.addSublayer(border)
}



