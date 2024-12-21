//
//  mapViewController.swift
//  01-FinalAssesment
//
//  Created by FCI on 12/12/24.
//

import UIKit
import MapKit
import CoreLocation

class mapViewController: UIViewController {

    // Declare UI Objects for user interaction
    @IBOutlet var mapView1:MKMapView!
    @IBOutlet var segmentedControl1: UISegmentedControl!
    @IBOutlet var urlField:UITextField!
    
    // Variables to store the fetched details from previous screen
    var latitudeValScreen2:Double!
    var longitudeValScreen2:Double!
    var addressValScreen2:String!
    var temperatureValScreen2: Double!
    var humidityValScreen2: Double!
    var weatherDetailsScreen2:String!
    
    // Home button
    @IBOutlet var homeButton2: UIBarButtonItem!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setting Region Details of the location to view on map
        let staticlocation = CLLocationCoordinate2D(latitude: latitudeValScreen2, longitude: longitudeValScreen2)
        let span1 = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region1 =  MKCoordinateRegion(center:staticlocation,span: span1)
        mapView1.setRegion(region1, animated: true)
        
        //Setting Annotation Details of the location on map
        let annotation = MKPointAnnotation()
        annotation.coordinate = staticlocation
        annotation.title =  addressValScreen2
        print("\(temperatureValScreen2!),\(humidityValScreen2!),\(weatherDetailsScreen2!)")
        annotation.subtitle = "Temp:\(temperatureValScreen2!), Humidity:\(humidityValScreen2!), Weather:\(weatherDetailsScreen2!)"
        mapView1.addAnnotation(annotation)
    }
    
    // This function is to handle different map viewing preferences
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
    
    // This funtion sends the user to root screen
    @IBAction func homeButton2Click() {
        
        self.navigationController?.popToRootViewController(animated: true)
        
    }
    
    // This function triggers a activity view controller for sharing the information
    @IBAction func shareDetails(){
        let address = addressValScreen2
        let temperature = temperatureValScreen2
        let humidity = humidityValScreen2
        let description = weatherDetailsScreen2.description
        let mywebsite = urlField.text
        
        let shareAll = [address!, mywebsite!, temperature!, humidity!, description] as [Any]
        
        print(shareAll)
        
        let activityViewController = UIActivityViewController(activityItems: shareAll, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController, animated: true)
    }

}


