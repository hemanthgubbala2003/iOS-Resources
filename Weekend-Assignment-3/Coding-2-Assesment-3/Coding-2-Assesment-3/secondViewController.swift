//
//  secondViewController.swift
//  Coding-2-Assesment-3
//
//  Created by FCI on 07/12/24.
//

import UIKit
import MapKit
import CoreLocation

class secondViewController: UIViewController {

    // Declare UI Objects
    @IBOutlet var mapView1:MKMapView!
    @IBOutlet var segmentedControl1: UISegmentedControl!
    
    var latitudeValScreen2:Double!
    var longitudeValScreen2:Double!
    var addressValScreen2:String!
    var temperatureValScreen2: Double!
    var humidityValScreen2: Double!
    var weatherDetailsScreen2:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let staticlocation = CLLocationCoordinate2D(latitude: latitudeValScreen2, longitude: longitudeValScreen2)
        let span1 = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        
        let region1 =  MKCoordinateRegion(center:staticlocation,span: span1)
        
        mapView1.setRegion(region1, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = staticlocation
        annotation.title =  addressValScreen2
        print("\(temperatureValScreen2!),\(humidityValScreen2!),\(weatherDetailsScreen2!)")
        annotation.subtitle = "Temp:\(temperatureValScreen2!), Humidity:\(humidityValScreen2!), Weather:\(weatherDetailsScreen2!)"
        mapView1.addAnnotation(annotation)
    }
    
    @IBAction func changeSegments(){
        
        
        let index:Int = segmentedControl1.selectedSegmentIndex
        
        if index == 0 {
            mapView1.mapType = .standard
        }
        else if index == 1{
            mapView1.mapType = .satellite
        }
        else{
            mapView1.mapType = .hybrid
        }
    }
    
}
