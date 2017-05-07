//
//  CategoryRow.swift
//  tab bar
//
//  Created by Buğra on 2.05.2017.
//  Copyright © 2017 Buğra Öz. All rights reserved.
//

import Foundation
import UIKit

class CategoryRow: UITableViewCell  {
    
    let images = ["L1","L2","L3","K4","K5","K6"]
    
    
    
    
}

extension CategoryRow: UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! CustonCollectionCell
        cell.layer.borderWidth = 1.0
        cell.CustomImageView.image = UIImage(named: images[indexPath.row])
        
        
        
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let itemsPerRow:CGFloat = 4
//        let hardCodePadding:CGFloat = 5
//        let itemWidth = (collectionView.bounds.width / itemsPerRow) - hardCodePadding
//        let itemHeight = collectionView.bounds.height - (2 * hardCodePadding)
        return CGSize(width: 200, height: 200)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! CustonCollectionCell
        cell.layer.borderWidth = 1.0
        cell.CustomImageView.image = UIImage(named: images[indexPath.row])
        
        if cell.CustomImageView.image == #imageLiteral(resourceName: "L1"){
            if let vc3 = UIStoryboard.init(name:"Main" ,bundle:nil).instantiateViewController(withIdentifier: "LevelVC") as? Level1CollectionViewController{
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController!.present(vc3 , animated:  true, completion: nil)
                
            }
        }
    }
    
   
    
}
