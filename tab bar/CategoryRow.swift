
import Foundation
import UIKit

protocol CategoryRawDelegate: class {
    func didTapCategoryRaw(for cell: CategoryRow, identifier: String, sections: Int)
}

class CategoryRow: UITableViewCell  {
    
    let images = ["L1","L2","L3","L4","L5"]
    weak var delegate: CategoryRawDelegate?
    var sections: Int?
    
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

        return CGSize(width: 200, height: 200)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! CustonCollectionCell
        cell.layer.borderWidth = 1.0
        cell.CustomImageView.image = UIImage(named: images[indexPath.row])
                
        switch indexPath.row {
        case 0:
            delegate?.didTapCategoryRaw(for: self, identifier: "ShowLevel1CollectionVC", sections: self.sections!)
        case 1:
            delegate?.didTapCategoryRaw(for: self, identifier: "ShowLevel2CollectionVC", sections: self.sections!)
        case 2:
            delegate?.didTapCategoryRaw(for: self, identifier: "ShowLevel3CollectionVC", sections: self.sections!)
        case 3:
            delegate?.didTapCategoryRaw(for: self, identifier: "ShowLevel4CollectionVC", sections: self.sections!)
        case 4:
            delegate?.didTapCategoryRaw(for: self, identifier: "ShowLevel5CollectionVC", sections: self.sections!)
        default:
            return
        }
       
    }
  
}
