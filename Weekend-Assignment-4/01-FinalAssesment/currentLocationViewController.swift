//
//  currentLocationViewController.swift
//  01-FinalAssesment
//
//  Created by FCI on 12/12/24.
//

import UIKit
import MapKit
import CoreLocation


class currentLocationViewController: UIViewController, CLLocationManagerDelegate {
    
    // Labels for displaying current location details
    @IBOutlet var latitudeLabel:UILabel!
    @IBOutlet var longitudeLabel:UILabel!
    @IBOutlet var addressLabel: UILabel!
    
    // Variables to get current location details
    var address1:String = ""
    var locationManager: CLLocationManager!
    
    // Buttons for user interaction
    @IBOutlet var currentLocationButton:UIButton!
    @IBOutlet var weatherDetailsButton: UIButton!
    @IBOutlet var mapButton: UIButton!
    
    // Labels for displaying weather details of current location with API
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var humidityLabel: UILabel!
    @IBOutlet var windSpeedLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    // Variables to store the fetched details
    var latitudeVal:Double!
    var longitudeVal:Double!
    var addressVal:String!
    var temperatureVal: Double!
    var humidityVal: Double!
    var weatherDetails:String!
    
    // Home button
    @IBOutlet var homeButton2: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        
        locationManager.requestAlwaysAuthorization()
    }
    
    
    // This function sets the current location details(Triggers on Event => Touch Up Inside)
    @IBAction func geoLocationDetailsButtonClick(){
        
        if CLLocationManager.locationServicesEnabled(){
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.distanceFilter = kCLDistanceFilterNone
            locationManager.startUpdatingLocation()
            print("Location services are enabled")
            
        }
        else{
            print("Location services are not enabled")
        }
    }
    
    //    This function sets the current location details on update
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
                    self.addressLabel.text =  "\(name),\(administrative),\(locality),\(country),\(postalCode)"
                    self.addressVal = "\(locality),\(administrative),\(country)"
                }
                    
            }
        }
        
        print("\(lat) and \(long)")
        
        latitudeLabel.text = "latitude: \(lat)"
        latitudeVal = lat
        longitudeLabel.text = "longitude: \(long)"
        longitudeVal = long
        addressLabel.text = "address: \(address1)"
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        
        print("\(error)")
    }


    // This functions parses the web response sent as json and retrieves the useful weather info
    func jsonParsing(data1:Data){
        
        if let firstDictionary = try? JSONSerialization.jsonObject(with: data1, options: .allowFragments) as? NSDictionary{
            
            print("first Dictionary values: \(firstDictionary)")
            
            
//          Get temperature and humditiy from main
            
            if let mainDictionary = firstDictionary.value(forKey: "main") as? NSDictionary {
                
                print("main Dictionary values are: \(mainDictionary)")
        
                if let temperaturevalue = mainDictionary.value(forKey: "temp") as? Double{
                        DispatchQueue.main.sync {
                            print("\(self.addressLabel.text!): \(temperaturevalue)°C")
                            self.temperatureLabel.text = " Temperature: \(temperaturevalue)°C"
                            self.temperatureVal = temperaturevalue
                     }
                }
                
                if let humidityValue = mainDictionary.value(forKey: "humidity") as? Double{
                    DispatchQueue.main.sync {
                        print("\(self.addressLabel.text!): \(humidityValue)")
                        self.humidityLabel.text = " Humidity: \(humidityValue)"
                        self.humidityVal = humidityValue
                    }
                    
                }
                
            }
            
//        Get WindSpeed from wind
                        
        if let windDictionary = firstDictionary.value(forKey: "wind") as? NSDictionary {
                            
            print("wind Dictionary values are: \(windDictionary)")
                    
            if let windspeedvalue = windDictionary.value(forKey: "speed") {
                DispatchQueue.main.sync {
                    print("\(self.addressLabel.text!): \(windspeedvalue)")
                    self.windSpeedLabel.text = " WindSpeed: \(windspeedvalue)"
                    }
                }
                            
            }
            
//           Get description from weather
            
            if let weatherArray = firstDictionary.value(forKey: "weather") as? NSArray,
               let weatherDictionary = weatherArray.firstObject as? NSDictionary {
                
                print("weather Dictionary values are: \(weatherDictionary)")
        
                if let descriptionvalue = weatherDictionary.value(forKey: "description") as? String {
                        DispatchQueue.main.sync {
                            print("\(self.addressLabel.text!): \(descriptionvalue)")
                            self.descriptionLabel.text = " Description: \(descriptionvalue)"
                            self.weatherDetails = descriptionvalue
                     }
                }
                
            }
            
                    
        }
        
    }
    
    // This function calls the api(Request) and after Response is fetched, it parses the JSON data
    @IBAction func getWeatherInfo(){
        
        
        //1. Setting the URL
        let session1 = URLSession.shared
        let webServiceURL = URL(string:"https://api.openweathermap.org/data/2.5/weather?lat=\(latitudeVal!)&lon=\(longitudeVal!)&appid=f31356634fbc4c64c86edd02aaf817c2&units=metric")!
        
        //2. Sending Request to Server
        let task1 = session1.dataTask(with: webServiceURL) {
            (data: Data?, response: URLResponse?, error: Error?) in
            if let error1 = error
            {
                print("Error:\n\(error1)")
            }
            else
            {
                if let data1 = data
                {
                    print("Bytes Data:\n\(data1)")
                    
                    //3. coverting bytes to String
                    let dataString = String(data: data1, encoding: String.Encoding.utf8)
                    print("All the weather data:\n\(dataString!)")
                    
                    self.jsonParsing(data1: data1)

                }
                print("something")
                
            }
        }
        task1.resume()
    }
            
    // This function sends the values to the next Screen(Map)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        let nextScreen = segue.destination as! mapViewController
        
        nextScreen.navigationItem.title = addressVal
        nextScreen.latitudeValScreen2 = latitudeVal
        nextScreen.longitudeValScreen2 = longitudeVal
        nextScreen.addressValScreen2 = address1
        nextScreen.temperatureValScreen2 = temperatureVal
        nextScreen.humidityValScreen2 = humidityVal
        nextScreen.weatherDetailsScreen2 = weatherDetails
        
        
    }
    
    // This funtion sends the user to root screen
    @IBAction func homeButton2Click() {
        
        self.navigationController?.popToRootViewController(animated: true)
        
    }

    
    

}
