//
//  ViewController.swift
//  tab bar
//
//  Created by Buğra on 28.04.2017.
//  Copyright © 2017 Buğra Öz. All rights reserved.
//

import UIKit


class ViewController: UIViewController , UITableViewDataSource {
    
    var categories = ["Beginner", "Elementary", "Intermadiate", "Advanced"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let navigationBar = UINavigationBar()
        navigationBar.topItem?.title = "New Title"
        
        
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
        
        
        
        return cell
    }
    
}












