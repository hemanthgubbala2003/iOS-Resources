//
//  secondViewController.swift
//  Task-8-Maps-Application
//
//  Created by FCI on 02/12/24.
//

import UIKit
import MapKit
import CoreLocation

class secondViewController: UIViewController {
    
    @IBOutlet var tf1: UITextField!
    @IBOutlet var tf2: UITextField!
    @IBOutlet var tf3: UITextField!

    @IBOutlet var mv1: MKMapView!
    @IBOutlet var b1: UIButton!
    @IBOutlet var sc1: UISegmentedControl!
    
//    var latitudeNo:Int!
//    var longitudeNo:Int!


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func b1Click(){
        
        let staticlocation1 = CLLocationCoordinate2D(latitude: Double(tf2.text!)!, longitude: Double(tf3.text!)!)

        let span1 = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        
        let region1 =  MKCoordinateRegion(center:staticlocation1,span: span1)
        
        mv1.setRegion(region1, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = staticlocation1
        annotation.title =  tf1.text
        mv1.addAnnotation(annotation)
    }
    
    @IBAction func changeSegments(){
        
        
        let index:Int = sc1.selectedSegmentIndex
        
        if index == 0 {
            mv1.mapType = .standard
        }
        else if index == 1{
            mv1.mapType = .satellite
        }
        else{
            mv1.mapType = .hybrid
        }
    }

}
