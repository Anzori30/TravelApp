//
//  texfieldStyle.swift
//  Travel(app)
//
//  Created by anzori  on 2/25/23.
//  Copyright © 2023 anzori . All rights reserved.
//

import UIKit

class texfieldStyle: UITextField {
    let placeholderColor = UIColor.lightGray
    let placeholderFont = UIFont.systemFont(ofSize: 16.0)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupField()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupField()
    }
    
    func setupField() {
        borderStyle = .none
        
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: placeholderColor,
            .font: placeholderFont
        ]
        attributedPlaceholder = NSAttributedString(string: placeholder!, attributes: attributes)
    }
}

