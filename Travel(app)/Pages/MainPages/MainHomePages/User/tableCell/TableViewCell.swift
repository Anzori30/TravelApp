//
//  TableViewCell.swift
//  Travel(app)
//
//  Created by anzori  on 2/18/23.
//  Copyright © 2023 anzori . All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet private weak var listName: UILabel!
    @IBOutlet private weak var nextButton: UIButton!
    let selectedBackground = UIView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        layer.cornerRadius = 15
        selectedBackground.backgroundColor = UIColor.init(red: 0.141, green: 0.267, blue: 0.267, alpha: 1)
        selectedBackground.layer.cornerRadius = 10.0
         selectedBackgroundView = selectedBackground
        //cornerRadius
        cornerRadiusUser(to: nextButton)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(with Item:Setting){
        listName.text = Item.listName
    }
    
}
