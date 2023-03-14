//
//  Appstyle.swift
//  Travel(app)
//
//  Created by anzori  on 2/9/23.
//  Copyright © 2023 anzori . All rights reserved.
//
import UIKit


private func backgraundColors() -> UIColor {
    
    let defaults = UserDefaults.standard
    let savedColor = defaults.string(forKey: "backgroundColor") ?? "white"
    
    if savedColor == "0" {
        return UIColor(named: "BackGroundColor_Green")!
    }
    else if savedColor == "1" {
        return UIColor(named: "BackGroundColor_Orange")!
    }
    else {
        if HomeViewControler().traitCollection.userInterfaceStyle == .dark || LogInViewControler().traitCollection.userInterfaceStyle == .dark {
               return UIColor(named: "BackGroundColor_Green")!
           } else {
               return UIColor(named: "BackGroundColor_Orange")!
        }
    }
    
}
func tabBarColor(tab:UITabBar){
    tab.backgroundColor = backgraundColors()
}
func bacgroundColor(view:UIView){
   view.backgroundColor = backgraundColors()
}

//mainviewsize
private var viewsize = Int()
// gradiand for View
func ViewtopGradiant(imageTopView:UIView!, mainView:UIView!){
    let gradientLayer = CAGradientLayer()
    imageTopView.layer.cornerRadius = 20
    imageTopView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    gradientLayer.frame = imageTopView.bounds
    gradientLayer.colors = [UIColor.clear.cgColor, backgraundColors().cgColor]
    gradientLayer.locations = [0.0, 0.177]
    gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
    gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
    imageTopView.layer.insertSublayer(gradientLayer, at: 0)
    gradientLayer.frame.size.width = mainView.frame.size.width
    viewsize = Int(mainView.frame.size.width - 40)
}
// border Bottom
func addBottomBorder(to stackView: UIStackView, color: UIColor = .lightGray, width: CGFloat = 1.0) {
    let border = CALayer()
    border.backgroundColor = color.cgColor
    border.frame = CGRect(x: 0, y: stackView.frame.size.height - width, width: stackView.frame.size.width, height: width)
    stackView.layer.addSublayer(border)
    border.frame.size.width = CGFloat(viewsize)
}
//textfield BorderBottom
func textField(to textField: UITextField, color: UIColor = .lightGray, width: CGFloat = 1.0) {
    let border = CALayer()
    border.backgroundColor = color.cgColor
    border.frame = CGRect(x: 0, y: textField.frame.size.height - width, width: textField.frame.size.width, height: width)
    textField.layer.addSublayer(border)
}



