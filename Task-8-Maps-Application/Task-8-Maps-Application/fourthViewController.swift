//
//  fourthViewController.swift
//  Task-8-Maps-Application
//
//  Created by FCI on 03/12/24.
//

import UIKit
import CoreLocation

class fourthViewController: UIViewController {
    
    @IBOutlet var bt1:UIButton!
    @IBOutlet var label1:UILabel!
    @IBOutlet var tf1:UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func b2Click(){
        
        let address = tf1.text!
        
        CLGeocoder().geocodeAddressString(address) { placemarks, error in
            
            if (error != nil ){
                return print("Error:\(error)")
            }
            
            if let placemark1 = placemarks?[0]{
                
                let lat = String(format: "%.04f", (placemark1.location?.coordinate.latitude ?? 0.0)!)
                
                let lon = String(format: "%.04f", (placemark1.location?.coordinate.longitude ?? 0.0)!)
                
                print("\(lat),\(lon)")
                
                self.label1.text = "Latitude: \(lat) and Longitude: \(lon)"
                
                
                
            }
                
        }
    }
    

}
