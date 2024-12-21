//
//  ViewController.swift
//  Task6-TableViews
//
//  Created by FCI on 27/11/24.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet var tv1: UITableView!
    @IBOutlet var tv2: UITableView!
    
    var displayList1:[String] = []
    var displayList2:[String] = []
    var displayList3:[String] = []
    var displayList4:[String] = []
    var displayList5:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        displayList1 = ["Tommy Shelby","Sherlock Holmes"]
        displayList2 = ["Dr.Cooper", "Murphy"]
        displayList3 = ["FedEx!", "Vamos!"]
        displayList4 = ["Cheeku", "Vada Pav"]
        displayList5 = ["Boom!", "Suiirajj!"]
        
        tv1.delegate = self
        tv1.dataSource = self
        tv2.delegate = self
        tv2.dataSource = self
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView == tv1{
            return 2
        }
        else{
            return 3
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tv1{
            if section == 0{
                return displayList1.count
            }
            else{
                return displayList2.count
            }
        }
        else{
            if section == 0{
                return displayList3.count
            }
            else if section == 1{
                return displayList4.count
            }
            else{
                return displayList5.count
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == tv1{
            if indexPath.section == 0{
//                return displayList1.count
                let cell1 = tv1.dequeueReusableCell(withIdentifier: "id1", for: indexPath)
                cell1.textLabel?.text = displayList1[indexPath.row]
                cell1.backgroundColor = .yellow
                cell1.accessoryType = .detailDisclosureButton
                return cell1
            }
            else{
//                return displayList2.count
                let cell2 = tv1.dequeueReusableCell(withIdentifier: "id1", for: indexPath)
                cell2.textLabel?.text = displayList2[indexPath.row]
                cell2.backgroundColor = .yellow
                cell2.accessoryType = .detailDisclosureButton
                return cell2
            }
        }
        else{
            if indexPath.section == 0{
//                return displayList3.count
                let cell3 = tv2.dequeueReusableCell(withIdentifier: "id2", for: indexPath)
                cell3.textLabel?.text = displayList3[indexPath.row]
                cell3.backgroundColor = .yellow
                cell3.accessoryType = .detailDisclosureButton
                return cell3
                
            }
            else if indexPath.section == 1{
//                return displayList4.count
                let cell4 = tv2.dequeueReusableCell(withIdentifier: "id2", for: indexPath)
                cell4.textLabel?.text = displayList4[indexPath.row]
                cell4.backgroundColor = .yellow
                cell4.accessoryType = .detailDisclosureButton
                return cell4
            }
            else{
//                return displayList5.count
                let cell5 = tv2.dequeueReusableCell(withIdentifier: "id2", for: indexPath)
                cell5.textLabel?.text = displayList5[indexPath.row]
                cell5.backgroundColor = .yellow
                cell5.accessoryType = .detailDisclosureButton
                
                return cell5
            }
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if tableView == tv1{
            if section == 0{
                return "TV Shows"
            }
            else{
                return "Movies"
            }
        }
        else{
            if section == 0{
                return "Tennis"
            }
            else if section == 1{
                return "Batters"
            }
            else{
                return "Bowlers"
            }
        }
    }
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if tableView == tv1{
            if section == 0{
                return "end 1"
            }
            else{
                return "end 2 "
            }
        }
        else{
            if section == 0{
                return "end 3"
            }
            else if section == 1{
                return "end 4"
            }
            else{
                return "end 5"
            }
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return 50
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        
        if tableView == tv1{
            let indexTitles = ["TV Shows","Movies"]
            return indexTitles
        }
        else{
            let indexTitles = ["Tennis","Batters","Bowlers"]
            return indexTitles
        }
    }
    


}

