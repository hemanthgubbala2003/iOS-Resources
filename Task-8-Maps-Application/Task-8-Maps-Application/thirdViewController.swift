//
//  thirdViewController.swift
//  Task-8-Maps-Application
//
//  Created by FCI on 02/12/24.
//

import UIKit
import CoreLocation


class thirdViewController: UIViewController {

    @IBOutlet var b1:UIButton!
    
    @IBOutlet var label1:UILabel!
    
    @IBOutlet var tf1: UITextField!
    @IBOutlet var tf2: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func b1Click(){
        
        let lat  =  Double(tf1.text!)!
        let lon =  Double(tf2.text!)!
        
        if let loc = CLLocation(latitude: lat, longitude: lon) as? CLLocation{
            CLGeocoder().reverseGeocodeLocation(loc) { placemarks, error in
                
                if let placemark1 = placemarks?[0]{
                    let name = placemark1.name!
                    let country = placemark1.country!
                    let administrative = placemark1.administrativeArea!
                    let locality = placemark1.locality!
                    let postalCode = placemark1.postalCode!
                    
                    print("\(name),\(administrative),\(locality),\(country),\(postalCode)")
                    
                    self.label1.text = "\(name),\(administrative),\(locality),\(country),\(postalCode)"

                }
                    
            }
        }
        else{
            print(" up")
        }
    }
    
    

}
