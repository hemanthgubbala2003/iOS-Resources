//
//  tableSecondViewController.swift
//  01-FinalAssesment
//
//  Created by FCI on 12/12/24.
//

import UIKit
import WebKit
import QuartzCore
import SafariServices

class tableSecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // Declare UI Objects for user interaction
    @IBOutlet var tableView1: UITableView!
    @IBOutlet var imageView1: UIImageView!
    
    // Display the link and name of the selected fields
    @IBOutlet var titleLabel1: UILabel!
    @IBOutlet var linkLabel1: UILabel!
    
    // Variables to send a Http Request to URL
    var url1:URL!
    var request1:URLRequest!
    
    // CoreAnimation layers to specify animation for UI Objects
    var cellLayer: CALayer!
    var tableLayer: CALayer!
    var imageLayer: CALayer!
    var labelLayer1: CALayer!
    var labelLayer2: CALayer!
    
    // This button displays action sheet and prompts user for web search option
    @IBOutlet var nextButton: UIButton!
    
    // Variables for storing travel services information
    var section1Names: [String] = []
    var section1Images: [String] = []
    var section1Links: [String] = []
    
    var section2Names: [String] = []
    var section2Images: [String] = []
    var section2Links: [String] = []

    var section3Names: [String] = []
    var section3Images: [String] = []
    var section3Links: [String] = []
    
    var section4Names: [String] = []
    var section4Images: [String] = []
    var section4Links: [String] = []


    
    override func viewDidLoad() {
        super.viewDidLoad()

        section1Names = ["Clear Trip","Yatra","Make My Trip"]
        section1Images = ["cleartrip.png","yatra.png","makemytrip.png"]

        section1Links = [
            "https://www.cleartrip.com",
            "https://www.yatra.com",
            "https://www.makemytrip.com"
        ]
        
        section2Names = ["IRCTC","IXIGO","GOIBIBO"]
        section2Images = ["irctc.png","ixigo.png","goibibo.png"]
        section2Links = [
            "https://www.irctc.co.in/nget/",
            "https://www.ixigo.com",
            "https://www.goibibo.com"
        ]
        
        section3Names = ["Abhi Bus","Red Bus","APSRTC"]
        section3Images = ["abhibus.png","redbus.png","APSRTC.png"]
        section3Links = [
            "https://www.abhibus.com",
            "https://www.redbus.in",
            "https://www.apsrtconline.in/"
        ]
        
        section4Names = ["IMAX","PVR","Book My Show"]
        section4Images = ["IMAX.png","PVR.png","bms.png"]
        section4Links = [
            "https://www.imax.com/en/in",
            "https://www.pvrcinemas.com",
            "https://in.bookmyshow.com/explore/home/hyderabad"
        ]

        
        tableLayer = tableView1.layer
        tableLayer.borderColor = UIColor.black.cgColor
        tableLayer.borderWidth = 5
        
        imageLayer = imageView1.layer
        imageLayer.borderColor = UIColor.black.cgColor
        imageLayer.borderWidth = 5
        
        labelLayer1 = titleLabel1.layer
        labelLayer1.borderColor = UIColor.black.cgColor
        labelLayer1.borderWidth = 5
        
        labelLayer1 = linkLabel1.layer
        labelLayer1.borderColor = UIColor.black.cgColor
        labelLayer1.borderWidth = 5
        
        tableView1.delegate = self
        tableView1.dataSource = self
        
    }
    
    // tableView Protcol Methods Implementation here
    
    // 1. number of Sections
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 5
    }
    
    //2. number of rows in a section
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 0
        }
        else if section == 1 {
            
            return section1Names.count
        }
        else if section == 2 {
            
            return section2Names.count
        }
        else if section == 3 {
            
            return section3Names.count
        }
        else {
            
            return section4Names.count
        }
        
    }
    
    //3. create & display the info in cells
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                
        if indexPath.section == 1 {
            
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "id1", for: indexPath)
            
            cell1.textLabel?.text = section1Names[indexPath.row]
            cell1.textLabel?.textColor = .white
            cell1.accessoryType = .detailDisclosureButton
            cell1.accessoryView?.backgroundColor = .white
            cell1.accessoryView?.tintColor = .white

            
            cellLayer = cell1.layer
            cellLayer.masksToBounds = true
            cellLayer.borderColor = UIColor.black.cgColor
            cellLayer.borderWidth = 0.5
            cellLayer.cornerRadius = 10
            
            return cell1
            
        }
        else if indexPath.section == 2 {
            
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "id1", for: indexPath)
            
            cell1.textLabel?.text = section2Names[indexPath.row]
            cell1.textLabel?.textColor = .white
            cell1.accessoryType = .detailDisclosureButton
            cell1.accessoryView?.backgroundColor = .white
            cell1.accessoryView?.tintColor = .white

            
            cellLayer = cell1.layer
            cellLayer.masksToBounds = true
            cellLayer.borderColor = UIColor.black.cgColor
            cellLayer.borderWidth = 0.5
            cellLayer.cornerRadius = 10
            
            return cell1
            
        }
        else if indexPath.section == 3 {
            
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "id1", for: indexPath)
            
            cell1.textLabel?.text = section3Names[indexPath.row]
            cell1.textLabel?.textColor = .white
            cell1.accessoryType = .detailDisclosureButton
            cell1.accessoryView?.backgroundColor = .white
            cell1.accessoryView?.tintColor = .white

            
            cellLayer = cell1.layer
            cellLayer.masksToBounds = true
            cellLayer.borderColor = UIColor.black.cgColor
            cellLayer.borderWidth = 0.5
            cellLayer.cornerRadius = 10
            
            return cell1
            
        }

        else {
            
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "id1", for: indexPath)
            
            cell2.textLabel?.text = section4Names[indexPath.row]
            cell2.textLabel?.textColor = .white
            cell2.accessoryType = .detailDisclosureButton
            cell2.accessoryView?.backgroundColor = .white
            cell2.accessoryView?.tintColor = .white
            
            cellLayer = cell2.layer
            cellLayer.masksToBounds = true
            cellLayer.borderColor = UIColor.black.cgColor
            cellLayer.borderWidth = 0.5
            cellLayer.cornerRadius = 10
            
            
            return cell2
        }
        
        
    }
    
    //4. Section Header Title
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0 {
            return "Book Travel Tickets"
            
        }
        else if section == 1 {
            return "Flights"
        }
        else if section == 2 {
            return "Trains"
        }
        else if section == 3 {
            return "Buses"
        }
        else{
            return "Movies"
        }

    }
    
    
    // 5. Section Footer Title

    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if section == 2 {
            
            return "End of Table"
        }

        return ""
    }
    
    //6. height for header
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 50
    }
    
    // 7. height for footer
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        if section == 0 {
            return 5
        }
        else {
            
            return 20
        }
    }
    
    //8. row height
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            
//            return 60
            return 0
        }
        else {
            
            return 50
        }
    }
    
    // 9. when user select any row in tableview
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 1 {
            
            titleLabel1.text = section1Names[indexPath.row]
            imageView1.image = UIImage(named: section1Images[indexPath.row])
            linkLabel1.text = section1Links[indexPath.row]
            tableView1.cellForRow(at: indexPath)?.selectionStyle = .none
            tableView1.sectionIndexBackgroundColor = .clear
            tableView1.separatorStyle = .singleLine
        }
        else if indexPath.section == 2 {
            
            titleLabel1.text = section2Names[indexPath.row]
            imageView1.image = UIImage(named: section2Images[indexPath.row])
            linkLabel1.text = section2Links[indexPath.row]
            tableView1.sectionIndexBackgroundColor = .clear
            tableView1.separatorStyle = .singleLine
        }
        else if indexPath.section == 3 {
            
            titleLabel1.text = section3Names[indexPath.row]
            imageView1.image = UIImage(named: section3Images[indexPath.row])
            linkLabel1.text = section3Links[indexPath.row]
            tableView1.sectionIndexBackgroundColor = .clear
            tableView1.separatorStyle = .singleLine
        }
        else {
            
            titleLabel1.text = section4Names[indexPath.row]
            imageView1.image = UIImage(named: section4Images[indexPath.row])
            linkLabel1.text = section4Links[indexPath.row]
            tableView1.sectionIndexBackgroundColor = .clear
            tableView1.separatorStyle = .singleLine
        }


    }
    
    //10. when user select any accessory detail button
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        
        if indexPath.section == 1 {
            
            titleLabel1.text = section1Names[indexPath.row]
            imageView1.image = UIImage(named: section1Images[indexPath.row])
            
        }
        else if indexPath.section == 2  {
            
            titleLabel1.text = section2Names[indexPath.row]
            imageView1.image = UIImage(named: section2Images[indexPath.row])
        }
        else if indexPath.section == 3  {
            
            titleLabel1.text = section3Names[indexPath.row]
            imageView1.image = UIImage(named: section3Images[indexPath.row])
        }
        else {
            titleLabel1.text = section4Names[indexPath.row]
            imageView1.image = UIImage(named: section4Images[indexPath.row])
        }

    }
    
    
    // 11. section index titles
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        
        let indexTitles = ["Top","Flights","Trains","Buses","Movies"]
        return indexTitles
        
    }
    
    // 12. section headers styling
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {

        if section == 0{
            if let header = view as? UITableViewHeaderFooterView {

                // Set the text color of the header
                header.textLabel?.textColor = UIColor.white
                header.textLabel?.font = UIFont.boldSystemFont(ofSize: 18)
                header.textLabel?.textAlignment = .center
                header.backgroundColor = .darkGray
                
                
            }

        }
        else{
            if let header = view as? UITableViewHeaderFooterView {

                // Set the text color of the header
                header.textLabel?.textColor = UIColor.white
                header.textLabel?.font = UIFont.boldSystemFont(ofSize: 16)
                
            }
        }
    }
    // animation triggers as soon as the view will appear
    override func viewWillAppear(_ animated: Bool) {
        self.animateTable()
    }
    
    // animation function
    func animateTable() {
        
        tableView1.reloadData()
        let cells = tableView1.visibleCells
        let tableHeight: CGFloat = tableView1.bounds.size.height
        for i in cells {
            let cell: UITableViewCell = i as UITableViewCell
            cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
        }
        var index = 0
        
        for a in cells {
            
            let cell: UITableViewCell = a as UITableViewCell
            
            UIView.animate(
                withDuration: 1.5,
                delay: 0.09 * Double(index),
                usingSpringWithDamping: 0.8,
                initialSpringVelocity: 0,
                options: .allowAnimatedContent,
                animations: {
                    cell.transform = CGAffineTransform(translationX: 0, y: 0);
                },
                completion: nil
            )
            index += 1 }
        }
    

    // This function provides an actionsheet, where user can select a web search option
    @IBAction func searchURL(){
        
        
        if tableView1.indexPathForSelectedRow == nil{
            
            let alert = UIAlertController(title: "Alert", message: "Please Select a row", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .destructive, handler:{ _ in print("User Click Dismiss button")
            }))
            
            self.present(alert, animated: true, completion: nil)
        }
        else{
            
            let alert = UIAlertController(title: "Web Search", message: "Please Select an Option", preferredStyle: .actionSheet)
            
            alert.addAction(UIAlertAction(title: "Safari Web View", style: .default, handler:{ _ in
                
                
                self.url1 = URL(string: String(self.linkLabel1.text!))
                let safariVC = SFSafariViewController(url: self.url1)
                self.present(safariVC,animated: true,completion: nil)
                print("User Click Approve button")
            }))
            
            alert.addAction(UIAlertAction(title: "Web Kit View", style: .default, handler:{ _ in
                
                self.url1 = URL(string: String(self.linkLabel1.text!))
                self.request1 = URLRequest(url: self.url1)
                
                let Storyboard1 = UIStoryboard(name: "Main", bundle: nil)
                let nextScreen1 = Storyboard1.instantiateViewController(withIdentifier: "id2") as! webViewController
                //            nextScreen1.webKitView1.load(self.request1)
                nextScreen1.url2 = self.url1
                nextScreen1.request2 = self.request1
                nextScreen1.navigationItem.title = self.titleLabel1.text
                self.navigationController?.pushViewController(nextScreen1, animated: true)
                
                print("User Click Edit button")
            }))
            
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler:{ _ in print("User Click Dismiss button")
            }))
            
            
            self.present(alert, animated: true, completion: nil)
            
        }
    }
    
}

