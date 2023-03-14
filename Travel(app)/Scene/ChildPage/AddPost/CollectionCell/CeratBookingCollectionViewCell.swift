//
//  CeratBookingCollectionViewCell.swift
//  Travel(app)
//
//  Created by macbook on 11.03.23.
//  Copyright © 2023 anzori . All rights reserved.
//

import UIKit

class CeratBookingCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var image: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        image.layer.cornerRadius = 20
    }

    func configure(with item:ImageUrl){
        image.image = item.image
    }
}
