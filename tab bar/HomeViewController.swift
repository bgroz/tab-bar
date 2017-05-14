
import UIKit


class HomeViewController: UIViewController , UITableViewDataSource {
    
    var categories = ["Beginner", "Elementary", "Intermadiate", "Advanced"]
 
    override func viewDidLoad() {
        super.viewDidLoad()
    
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
//        cell.delegate = self
        
        return cell
    }
    
}

extension HomeViewController: CategoryRawDelegate {
    
    func didTapCategoryRaw(for cell: CategoryRow, identifier: String, sections: Int) {
    
        switch  {
        case 0:
            self.performSegue(withIdentifier: identifier, sender: nil)
        default:
            return
        }
        

    }
}







