//
//  firstTableViewController.swift
//  Coding-2-Assignment-2
//
//  Created by FCI on 28/11/24.
//

import UIKit

class firstTableViewController: UITableViewController {
    
    var section1Names:[String] = []
    var section1Images:[String] = []
    var section1Texts:[String] = []
    
    var section2Names:[String] = []
    var section2Images:[String] = []
    var section2Texts:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        section1Names = ["frittata","roasted-cauliflower","vegan-ramen"]
        section1Images = ["frittata.png","roasted-cauliflower.png","vegan-ramen.png"]
        section1Texts = ["frittata","roasted-cauliflower","vegan-ramen"]
        
        section2Names = ["shakshuka","shawarma","spicy-lamb-kofta"]
        section2Images = ["shakshuka.png","shawarma.png","spicy-lamb-kofta.png"]
        section2Texts = ["shakshuka","shawarma","spicy-lamb-kofta"]
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
            
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "id1", for: indexPath)
            cell1.textLabel?.text = section1Names[indexPath.row]
            cell1.backgroundColor = .yellow
            return cell1
        }
        else{
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "id1", for: indexPath)
            cell2.textLabel?.text = section2Names[indexPath.row]
            cell2.backgroundColor = .yellow

            return cell2
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0{
            
            let Storyboard1 = UIStoryboard(name: "Main", bundle: nil)
            
            let nextScreen1 = Storyboard1.instantiateViewController(withIdentifier: "id1") as! ViewController
            
            nextScreen1.name = section1Texts[indexPath.row]
            nextScreen1.textFileName = section1Texts[indexPath.row]
            //nextScreen1.imageFileName = section1Images[indexPath.row]
            //print("\(nextScreen1.imageFileName!)")
            nextScreen1.number = indexPath.row
            self.navigationController?.pushViewController(nextScreen1, animated: true)
            
        }
        else{
            
            let Storyboard1 = UIStoryboard(name: "Main", bundle: nil)
            
            let nextScreen1 = Storyboard1.instantiateViewController(withIdentifier: "id1") as! ViewController
            nextScreen1.name = section2Texts[indexPath.row]
            nextScreen1.textFileName = section2Texts[indexPath.row]
            //nextScreen1.imageFileName = section2Images[indexPath.row]
            //print("\(nextScreen1.imageFileName!)")
            nextScreen1.number = 2+indexPath.row
            self.navigationController?.pushViewController(nextScreen1, animated: true)
        }
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
     
        let indexTitles = ["Veg Food","Non-Veg Food"]
        return indexTitles
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return "Veg Food"
        }
        else{
            return "Non-Veg Food"
        }
    }
    
    

    

}
