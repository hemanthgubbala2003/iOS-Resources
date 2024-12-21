//
//  sixthViewController.swift
//  Task-8-Maps-Application
//
//  Created by FCI on 05/12/24.
//

import UIKit
import MapKit
import CoreLocation

class sixthViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet var mv1: MKMapView!
    @IBOutlet var b1: UIButton!
    @IBOutlet var sc1: UISegmentedControl!
    
    @IBOutlet var sourceLoc:UITextField!
    @IBOutlet var destinationLoc:UITextField!
    
    var sourceLat:Double!
    var sourceLon:Double!
    
    var destinationLat:Double!
    var destinationLon:Double!
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        mv1.delegate = self
        

    }
    
    func setCoordinates(){
        
        //        Get coordinates for source
                 
                let address = sourceLoc.text!
                
                CLGeocoder().geocodeAddressString(address) { placemarks, error in
                    
                    if (error != nil ){
                        return print("Error:\(error)")
                    }
                    
                    if let placemark1 = placemarks?[0]{
                        
                        self.sourceLat = placemark1.location?.coordinate.latitude ?? 0.0
                        
                        self.sourceLon = placemark1.location?.coordinate.longitude ?? 0.0
                        
                        print("\(self.sourceLat),\(self.sourceLon)")
                         
                        
                    }
                        
                }
                
        //      Get coordinates for destination
                let address2 = destinationLoc.text!
                
                CLGeocoder().geocodeAddressString(address2) { placemarks, error in
                    
                    if (error != nil ){
                        return print("Error:\(error)")
                    }
                    
                    if let placemark1 = placemarks?[0]{
                        
                        self.destinationLat = placemark1.location?.coordinate.latitude ?? 0.0
                        
                        self.destinationLon = placemark1.location?.coordinate.longitude ?? 0.0
                        
                        print("\(self.destinationLat),\(self.destinationLon)")
                         
                        
                    }
                        
                }
        print("\(self.sourceLat),\(self.sourceLon)")
        print("\(self.destinationLat),\(self.destinationLon)")
        
    }
    
    
    //Function to add a Pin
    func addPins() {
         
            let startPin = MKPointAnnotation()
            startPin.title = "start"
            startPin.coordinate = CLLocationCoordinate2D(
                latitude:sourceLat,
                longitude:sourceLon
                
            )
            mv1.addAnnotation(startPin)
            
            let endPin = MKPointAnnotation()
            endPin.title = "end"
            endPin.coordinate = CLLocationCoordinate2D(
                latitude:destinationLat,
                longitude:destinationLon
            )
            mv1.addAnnotation(endPin)
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
            annotationView?.image = UIImage(named: "pencil")
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
    
    
    @IBAction func b1Click() {
        
        // Code for  displaying static loaction information in mapview
        setCoordinates()

        
        self.addPins()

        
        self.showRouteOnMap(pickupCoordinate: CLLocationCoordinate2D(
            latitude: sourceLat,
            longitude: sourceLon
            
        ), destinationCoordinate: CLLocationCoordinate2D(
            latitude: destinationLat,
            longitude: destinationLon
        ))
        
        
        let staticlocation = CLLocationCoordinate2D(
                  latitude: 17.45357,
                  longitude: 78.37043
              )
        
        let span1 = MKCoordinateSpan(latitudeDelta: 0.003, longitudeDelta: 0.003)
                  
        let region1 = MKCoordinateRegion(center: staticlocation, span: span1)
                         
        mv1.setRegion(region1, animated: true)
        
        // Annotations
        
        // displaying Annotation on Mapview
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = staticlocation
        annotation.title = "INNOVAPPTIVE SOLUTIONS Pvt Ltd"
        annotation.subtitle = "Purva Summit, IN-HYD-CGW, Level 7, HITEC City, Telangana 500081"
        mv1.addAnnotation(annotation)
        
    }
    
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
    
    
  


}

