//
//  CategoryRow.swift
//  tab bar
//
//  Created by Buğra on 2.05.2017.
//  Copyright © 2017 Buğra Öz. All rights reserved.
//

import Foundation
import UIKit

protocol CategoryRawDelegate: class {
    func didTapCategoryRaw(for cell: CategoryRow)
}

class CategoryRow: UITableViewCell  {
    
    let images = ["L1","L2","L3","L4","L5"]
    
    weak var delegate: CategoryRawDelegate?
}

extension CategoryRow: UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! CustonCollectionCell
        cell.layer.borderWidth = 1.0
//        cell.CustomImageView.image = UIImage(named: images[indexPath.row])
        
        
        
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: 200, height: 200)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! CustonCollectionCell
        cell.layer.borderWidth = 1.0
        cell.CustomImageView.image = UIImage(named: images[indexPath.row])
        delegate?.didTapCategoryRaw(for: self)
        
        

        
        
    }
    
   
    
}
