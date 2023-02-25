//
//  MapCollectionViewCell.swift
//  Travel(app)
//
//  Created by anzori  on 2/18/23.
//  Copyright © 2023 anzori . All rights reserved.
//

import UIKit

class MapCollectionViewCell: UICollectionViewCell {

     @IBOutlet  weak var image: UIImageView!
      override func awakeFromNib() {
          super.awakeFromNib()
          // Initialization code
          image.layer.cornerRadius = image.frame.width / 20
        layer.cornerRadius = image.frame.width / 20
      }

}
