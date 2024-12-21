//
//  ViewController.swift
//  Coding-2-Assesment-3
//
//  Created by FCI on 07/12/24.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {
    
    // Declare UI Objects

    @IBOutlet var locationField:UITextField!
    
    @IBOutlet var weatherDetailsButton: UIButton!
    @IBOutlet var mapButton: UIButton!
    
    @IBOutlet var latitudeLabel: UILabel!
    @IBOutlet var longitudeLabel: UILabel!
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var humidityLabel: UILabel!
    @IBOutlet var windSpeedLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    
    var latitudeVal:Double!
    var longitudeVal:Double!
    var addressVal:String!
    var temperatureVal: Double!
    var humidityVal: Double!
    var weatherDetails:String!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func jsonParsing(data1:Data){
        
        if let firstDictionary = try? JSONSerialization.jsonObject(with: data1, options: .allowFragments) as? NSDictionary{
            
            print("first Dictionary values: \(firstDictionary)")
            
            
//            Get Co-ordinates from coord
            
            if let coordDictionary = firstDictionary.value(forKey: "coord") as? NSDictionary {
                
                print("coord Dictionary values are: \(coordDictionary)")
        
                                                                                                
                if let latitudevalue = coordDictionary.value(forKey: "lat") as? Double {
                        DispatchQueue.main.sync {
                            print("\(self.locationField.text!): \(latitudevalue)")
                            self.latitudeLabel.text = " Latitude: \(latitudevalue)"
                            self.latitudeVal = latitudevalue
                     }
                }
                
                if let longitudevalue = coordDictionary.value(forKey: "lon") as? Double {
                    DispatchQueue.main.sync {
                        print("\(self.locationField.text!): \(longitudevalue)")
                        self.longitudeLabel.text = " Longitude: \(longitudevalue)"
                        self.longitudeVal = longitudevalue
                    }
                    
                }
                
            }
            
//          Get temperature and humditiy from main
            
            if let mainDictionary = firstDictionary.value(forKey: "main") as? NSDictionary {
                
                print("main Dictionary values are: \(mainDictionary)")
        
                if let temperaturevalue = mainDictionary.value(forKey: "temp") as? Double{
                        DispatchQueue.main.sync {
                            print("\(self.locationField.text!): \(temperaturevalue)°C")
                            self.temperatureLabel.text = " Temperature: \(temperaturevalue)°C"
                            self.temperatureVal = temperaturevalue
                     }
                }
                
                if let humidityValue = mainDictionary.value(forKey: "humidity") as? Double{
                    DispatchQueue.main.sync {
                        print("\(self.locationField.text!): \(humidityValue)")
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
                    print("\(self.locationField.text!): \(windspeedvalue)")
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
                            print("\(self.locationField.text!): \(descriptionvalue)")
                            self.descriptionLabel.text = " Description: \(descriptionvalue)"
                            self.weatherDetails = descriptionvalue
                     }
                }
                
            }
            
                    
        }
        
    }
    
    func reverseGeoCoding(){
        
        let lat  = latitudeVal!
        let lon = longitudeVal!
        
        if let loc = CLLocation(latitude: lat, longitude: lon) as? CLLocation{
            CLGeocoder().reverseGeocodeLocation(loc) { placemarks, error in
                
                if let placemark1 = placemarks?[0]{
                    let name = placemark1.name!
                    let country = placemark1.country!
                    let administrative = placemark1.administrativeArea!
                    let locality = placemark1.locality!
                    let postalCode = placemark1.postalCode!
                    
                    print("\(name),\(administrative),\(locality),\(country),\(postalCode)")
                    
                    self.addressLabel.text = "\(name),\(administrative),\(locality),\(country),\(postalCode)"
                    self.addressVal = "\(name),\(administrative),\(locality),\(country),\(postalCode)"

                }
                    
            }
        }

    }
    
    @IBAction func getWeatherInfo(){
        
        //1. Setting the URL
        let session1 = URLSession.shared
        let webServiceURL = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(locationField.text!)?&APPID=2007179fa0b5494464f43cb09e2763b5&units=metric")!
        
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
                    self.reverseGeoCoding()

                }
                print("something")
                
            }
        }
        task1.resume()
    }
            
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        let nextScreen = segue.destination as! secondViewController
        
        nextScreen.navigationItem.title = locationField.text
        nextScreen.latitudeValScreen2 = latitudeVal
        nextScreen.longitudeValScreen2 = longitudeVal
        nextScreen.addressValScreen2 = addressVal
        nextScreen.temperatureValScreen2 = temperatureVal
        nextScreen.humidityValScreen2 = humidityVal
        nextScreen.weatherDetailsScreen2 = weatherDetails
        
    }

    

}

