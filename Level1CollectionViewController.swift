//
//  Level1CollectionViewController.swift
//  tab bar
//
//  Created by Buğra on 6.05.2017.
//  Copyright © 2017 Buğra Öz. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class Level1CollectionViewController: UICollectionViewController , UITextFieldDelegate {
    
    
    var backImage = UIImage(named: "kapaticon")
    let limitLength = 1
    var saybak = 0
    
    
    var letterArray = ["A","P","P","L","E"]
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.collectionView?.cellForItem(at: IndexPath.init(row: 0, section: 0))?.becomeFirstResponder()
        
        
        //        self.collectionView!.delegate = self
        self.collectionView?.dataSource = self
        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        backButton()
        
        self.collectionView?.reloadData()
        // Do any additional setup after loading the view.
    }
    func backButton(){
        
        let backBtn = UIBarButtonItem(image: backImage, style: UIBarButtonItemStyle.plain, target: self, action: #selector(Level1CollectionViewController.goBack))
        navigationItem.title = "Level 1"
        navigationItem.leftBarButtonItem = backBtn
        
    }
    
    
    func goBack(){
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //auto selected 1st item
        
    }
    
    
    
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 10
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 10
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        
        let txtField2 = UITextField(frame: CGRect(x: 1, y: 1, width: 30, height: 27))
    
        
        txtField2.delegate = self
        
      
        DispatchQueue.main.async {
            txtField2.backgroundColor = .blue
            txtField2.autocapitalizationType = .allCharacters
            txtField2.autocorrectionType = .no
            txtField2.textAlignment = .center
            txtField2.keyboardType = .alphabet
            txtField2.tintColor = .clear
            cell.addSubview(txtField2)
        }
        
        
        if(indexPath.item == 0 && indexPath.row == 0 && saybak == 0){
            txtField2.becomeFirstResponder()
            saybak += 1
        }
        
       
        
        
        
        return cell
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool
    {
        
        let maxLength = 1
        let currentString: NSString = textField.text! as NSString
        let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
        
//        var indexes = letterArray.enumerated().filter {
//            $0.element.contains(textField.text!)
//            }.map{$0.offset}
        
        if letterArray.{
            print("OK")
        }
        
        
        
        return newString.length <= maxLength
    }
    
   
    
    
    // MARK: UICollectionViewDelegate
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
     
     }
     */
    
}


