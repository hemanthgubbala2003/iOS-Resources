//
//  fifthViewController.swift
//  Task-8-Maps-Application
//
//  Created by FCI on 03/12/24.
//

import UIKit
import CoreLocation
import MapKit

class fifthViewController: UIViewController,CLLocationManagerDelegate {

    @IBOutlet var mv1:MKMapView!
    
    @IBOutlet var bt1:UIButton!
    
    @IBOutlet var label1:UILabel!
    @IBOutlet var label2:UILabel!
    @IBOutlet var label3:UILabel!
    @IBOutlet var label4:UILabel!
    
    var address1:String = ""
    
    var locationManager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        locationManager = CLLocationManager()
        
        locationManager.requestAlwaysAuthorization()
    }
    
    @IBAction func geoLocationDetailsButtonClick(){
        
        if CLLocationManager.locationServicesEnabled(){
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.distanceFilter = kCLDistanceFilterNone
            locationManager.startUpdatingLocation()
            print("Location services are enabled")
            label1.text = "Location services are enabled"
            
        }
        else{
            print("Location services are not enabled")
            label1.text = "Location services are not enabled"
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let lat: Double  = manager.location!.coordinate.latitude
        let long: Double = manager.location!.coordinate.longitude
        if let loc = CLLocation(latitude: lat, longitude: long) as? CLLocation{
            CLGeocoder().reverseGeocodeLocation(loc) { placemarks, error in
                
                if let placemark1 = placemarks?[0]{
                    let name = placemark1.name!
                    let country = placemark1.country!
                    let administrative = placemark1.administrativeArea!
                    let locality = placemark1.locality!
                    let postalCode = placemark1.postalCode!
                    
                    print("\(name),\(administrative),\(locality),\(country),\(postalCode)")
                    
                    self.address1 = "\(name),\(administrative),\(locality),\(country),\(postalCode)"

                }
                    
            }
        }
        
        print("\(lat) and \(long)")
        
        label2.text = "latitude: \(lat)"
        label3.text = "longitude: \(long)"
        label4.text = "address: \(address1)"
        
        
        let locationValue: CLLocationCoordinate2D = manager.location!.coordinate
        
        let span1 = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        
        let region1 =  MKCoordinateRegion(center:locationValue,span: span1)
        
        mv1.setRegion(region1, animated: true)
        mv1.mapType = .satellite
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = locationValue
        annotation.title = address1
        annotation.subtitle = "subtitle"
        mv1.addAnnotation(annotation)

        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        
        print("\(error)")
        label1.text = "\(error)"
    }

    

}
