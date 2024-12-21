//
//  navigationViewController.swift
//  01-FinalAssessment
//
//  Created by FCI on 13/12/24.
//

import UIKit
import MapKit
import CoreLocation

/// This View Displays the Navigation Module
class navigationViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    // Declare UI Objects for user interaction
    @IBOutlet var mv1: MKMapView!
    @IBOutlet var showMapButton: UIButton!
    @IBOutlet var sc1: UISegmentedControl!
    @IBOutlet var sourceLoc: UITextField!
    @IBOutlet var destinationLoc: UITextField!
    
    // Variables to get current location details
    var locationManager: CLLocationManager!

    // Variables to store the source and destination co-ordinates
    var sourceLat: Double!
    var sourceLon: Double!
    var destinationLat: Double!
    var destinationLon: Double!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager.requestAlwaysAuthorization()
        
        mv1.delegate = self
}
    
    //Function is to add a Pin, that is the location points on the map and show Route
    func addPins() {

        // Set starting location on map
        let startPin = MKPointAnnotation()
        startPin.title = "Start"
        startPin.coordinate = CLLocationCoordinate2D(latitude: self.sourceLat!, longitude: self.sourceLon!)
        mv1.addAnnotation(startPin)
        
        // Set ending location on map
        let endPin = MKPointAnnotation()
        endPin.title = "End"
        endPin.coordinate = CLLocationCoordinate2D(latitude: self.destinationLat!, longitude: self.destinationLon!)
        mv1.addAnnotation(endPin)
        
        // Show route between start ahd end locations
        showRouteOnMap(
            pickupCoordinate: CLLocationCoordinate2D(latitude: self.sourceLat!, longitude: self.sourceLon!),
            destinationCoordinate: CLLocationCoordinate2D(latitude: self.destinationLat!, longitude: self.destinationLon!)
        )
    }

    // This function is to set the destination co-ordinates
    @IBAction func setCoordinates() {
        
        let address = destinationLoc.text!
        CLGeocoder().geocodeAddressString(address, completionHandler: { placemarks, error in
        if (error != nil) {
        return
            print("\(error)")
        }
        if let placemark1 = placemarks?[0] {
            
            self.destinationLat = (placemark1.location?.coordinate.latitude ?? 0.0)!
            self.destinationLon = (placemark1.location?.coordinate.longitude ?? 0.0)!
            print("\(self.destinationLat!),\(self.destinationLon!)")
            
        }
    })

    }
    
    // This function triggers when user hits set, after destination addresss is entered, to avoid nil values
    @IBAction func showOnMap(){
        self.addPins()

    }
    
    // This function sets the co-ordinates to current location
    @IBAction func currentCoordinates(){
        
        if CLLocationManager.locationServicesEnabled(){
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.distanceFilter = kCLDistanceFilterNone
            locationManager.startUpdatingLocation()
            
            sourceLat = Double(locationManager.location!.coordinate.latitude)
            sourceLon = Double(locationManager.location!.coordinate.longitude)
            
            print("\(sourceLat!) and \(sourceLon!)")
            
            print("Location services are enabled")
            
        }
        else{
            print("Location services are not enabled")
        }
    }
    
    // This function updates the co-ordinates to current location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        sourceLat = Double(manager.location!.coordinate.latitude)
        sourceLon = Double(manager.location!.coordinate.longitude)
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        
        print("\(error)")
    }
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "custom")
        
        if annotationView == nil {
            //Create View
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "custom")
        } else {
            //Assign annotation
            annotationView?.annotation = annotation
        }
        
        //Set image
        switch annotation.title {
        case "end":
            annotationView?.image = UIImage(systemName: "pencil")
        case "start":
            annotationView?.image = UIImage(systemName: "circle")
        default:
            break
        }
        
        return annotationView
    }
    
    
    //
    
    // MARK: - showRouteOnMap

    func showRouteOnMap(pickupCoordinate: CLLocationCoordinate2D, destinationCoordinate: CLLocationCoordinate2D) {

        
        let sourcePlacemark = MKPlacemark(coordinate: pickupCoordinate, addressDictionary: nil)
        let destinationPlacemark = MKPlacemark(coordinate: destinationCoordinate, addressDictionary: nil)

        let sourceMapItem = MKMapItem(placemark: sourcePlacemark)
        let destinationMapItem = MKMapItem(placemark: destinationPlacemark)

        let sourceAnnotation = MKPointAnnotation()

        if let location = sourcePlacemark.location {
            sourceAnnotation.coordinate = location.coordinate
        }

        let destinationAnnotation = MKPointAnnotation()

        if let location = destinationPlacemark.location {
            destinationAnnotation.coordinate = location.coordinate
        }

        self.mv1.showAnnotations([sourceAnnotation,destinationAnnotation], animated: true )

         
        
        let directionRequest = MKDirections.Request()
        directionRequest.source = sourceMapItem
        directionRequest.destination = destinationMapItem
        directionRequest.transportType = .any

        // Calculate the direction
        let directions = MKDirections(request: directionRequest)

        directions.calculate {
            (response, error) -> Void in

            guard let response = response else {
                if let error = error {
                    print("Error: \(error)")
                }

                return
            }

            let route = response.routes[0]

            self.mv1.addOverlay((route.polyline), level: MKOverlayLevel.aboveRoads)

            let rect = route.polyline.boundingMapRect
            self.mv1.setRegion(MKCoordinateRegion(rect), animated: true)
        }
    }

    // MARK: - MKMapViewDelegate

    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {

        let renderer = MKPolylineRenderer(overlay: overlay)

        renderer.strokeColor = UIColor(red: 17.0/255.0, green: 147.0/255.0, blue: 255.0/255.0, alpha: 1)

        renderer.lineWidth = 5.0

        return renderer
    }
    
    // Function to change Map Viewing preferrences
    @IBAction func sc1Click() {
        
        let index: Int = sc1.selectedSegmentIndex
        
        if index == 0 {
            mv1.mapType = .standard
        }
        else if index == 1{
            mv1.mapType = .satellite
        }
        
        else {
            mv1.mapType = .hybrid
            
        }
    }
    // This function is a generic alert function , with a settable custom error message and title
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true)
    }
    
    
}

