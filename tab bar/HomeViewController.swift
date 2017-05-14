//
//  ViewController.swift
//  tab bar
//
//  Created by Buğra on 28.04.2017.
//  Copyright © 2017 Buğra Öz. All rights reserved.
//

import UIKit


class HomeViewController: UIViewController , UITableViewDataSource {
    
    var categories = ["Beginner", "Elementary", "Intermadiate", "Advanced"]
 
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier ?? "" {
        case ShowLevel1CollectionVC:
            
        default:
            <#code#>
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return categories[section]

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CategoryRow
        cell.delegate = self
        return cell
    }
    
}

extension HomeViewController: CategoryRawDelegate {
    
    func didTapCategoryRaw(for cell: CategoryRow) {
    
        switch  {
        case <#pattern#>:
            <#code#>
        default:
            <#code#>
        }
        self.performSegue(withIdentifier: "ShowLevel1CollectionVC", sender: nil)
        
        self.performSegue(withIdentifier: "ShowLevel2CollectionVC", sender: nil)
        
        
    }
}







