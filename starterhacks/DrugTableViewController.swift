//
//  DrugTableViewController.swift
//  starterhacks
//
//  Created by Cumar Yusuf on 2019-01-13.
//  Copyright © 2019 Cumar Yusuf. All rights reserved.
//

import UIKit

protocol DrugDelegate
{
    func change(row: Int, status: String)
}

class DrugTableViewCell: UITableViewCell {
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var dose: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var img: UIImageView!
}

class DrugTableViewController: UITableViewController, DrugDelegate {
    
    
    var drugs = [["image": UIImage(named: "cannabis")!,"status": "no", "name": "Cannabis", "dose": "10 mg"],
                 ["image": UIImage(named: "vicodin")!, "status": "no", "name": "Vicodin", "dose": "7.5 mg"],
                 ["image": UIImage(named: "acarbose")!, "status": "no","name": "Acarbose", "dose": "2.5 mg"],
                 ["image": UIImage(named: "prinivil")!, "status": "no","name": "Prinivil", "dose": "10.5 mg"]]
    var row = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = .none
        
        
        let alertController = UIAlertController(title: "App", message: "Hey, you have some drugs overdue. Please let me know if you've taken them", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Prescribed Drugs"
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return drugs.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DrugTableViewCell
        print(indexPath.row)
        if (drugs[indexPath.row]["status"] as! String == "no"){
            cell.img2.image = UIImage(named: "warning")
        }
        else{
            cell.img2.image = UIImage(named: "success")
        }
        
        cell.img.image = drugs[indexPath.row]["image"] as? UIImage
        cell.name.text = drugs[indexPath.row]["name"] as? String
        cell.dose.text = drugs[indexPath.row]["dose"] as? String
     
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "drug") {
            if let indexPath = tableView.indexPathForSelectedRow{
                // initialize new view controller and cast it as your view controller
                let vc = segue.destination as! ViewController
                vc.row = indexPath.row
                vc.delegate = self
            }
        }
    }
    
    func change(row: Int, status: String){
        if (status == "no"){
            drugs[row]["status"] = "no"
        }
        else{
            drugs[row]["status"] = "yes"
        }
        self.tableView.reloadData()
    }
}
