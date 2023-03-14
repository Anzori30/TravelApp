//
//  DetalPageViewControllerDatasorce.swift
//  Travel(app)
//
//  Created by macbook on 14.03.23.
//  Copyright © 2023 anzori . All rights reserved.
//


import UIKit
protocol DetalPageViewControllerDelegate{
    func click(image:UIImage)
}
class DetalPageViewControllerDatasorce: NSObject {
    var delegate : DetalPageViewControllerDelegate?
    let myClass = DetalPageViewController()
    var collection: UICollectionView
    var collectionImage: UICollectionView
    init(with collection: UICollectionView,collectionImage:UICollectionView) {
        self.collectionImage = collectionImage
        self.collection = collection
        super.init()
        self.collection.dataSource = self
        self.collection.delegate = self
        self.collectionImage.dataSource = self
        self.collectionImage.delegate = self
        collection.register(UINib(nibName: "DetalPageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DetalPageCollectionView")
        collectionImage.register(UINib(nibName: "DetalPagePhotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DetalPagePhotoCollectionViewCell")
    }
  

}



extension DetalPageViewControllerDatasorce: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Return different number of items based on the collection view
        if collectionView == self.collectionImage {
            return 4
        }
        else {
            return 2
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        if collectionView == self.collectionImage {
            let cell = collectionImage.dequeueReusableCell(withReuseIdentifier: "DetalPagePhotoCollectionViewCell", for: indexPath) as! DetalPagePhotoCollectionViewCell
            cell.image.heightAnchor.constraint(equalToConstant: 80).isActive = true
            cell.image.widthAnchor.constraint(equalToConstant: 80).isActive = true
            cell.layer.cornerRadius = 20
            if indexPath.row == 3{
                cell.lable.isHidden = false
            }
            else{
              
            }
            return cell
        }
        else {
            let cell = collection.dequeueReusableCell(withReuseIdentifier: "DetalPageCollectionView", for: indexPath) as! DetalPageCollectionViewCell
            print(collection.frame.width)
            cell.stackView.widthAnchor.constraint(equalToConstant: collection.frame.width).isActive = true
            return cell
        }
        
        
    }
    
}

extension DetalPageViewControllerDatasorce: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        if collectionView == self.collectionImage {
            let cell = collectionImage.dequeueReusableCell(withReuseIdentifier: "DetalPagePhotoCollectionViewCell", for: indexPath) as! DetalPagePhotoCollectionViewCell
            if indexPath.row == 3{
                
            }
            else{
                delegate?.click(image: cell.image.image!)
            }
        }
        else {
          
        }
    }
}

extension DetalPageViewControllerDatasorce: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = collection.bounds.width
        let itemHeight = collection.frame.height
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
}




