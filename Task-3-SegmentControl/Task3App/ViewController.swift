//
//  ViewController.swift
//  Task3App
//
//  Created by FCI on 25/11/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var t1: UITextView!
    @IBOutlet var seg1: UISegmentedControl!
    @IBOutlet var lbl1: UILabel!
    @IBOutlet var img1: UIImageView!
    
    
    var t2: UITextView!
    var seg2: UISegmentedControl!
    var lbl2: UILabel!
    var img2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        seg2 = UISegmentedControl(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
//        lbl2 = UILabel(frame: CGRect(x: 100, y: 200, width: 100, height: 100))
//        img2 = UIImageView(frame: CGRect(x: 100, y: 300, width: 100, height: 100))
//        t2 = UITextView(frame: CGRect(x: 100, y: 400, width: 100, height: 100))
//        
//        self.view.addSubview(seg2)
//        self.view.addSubview(lbl2)
//        self.view.addSubview(t2)
//        self.view.addSubview(img2)
//        changeSegments2()
    }
    
    @IBAction func changeSegments(){
        
        
        let index:Int = seg1.selectedSegmentIndex
        lbl1.text = seg1.titleForSegment(at: index)
        
        if index == 0 {
            self.view.backgroundColor = .orange
            seg1.selectedSegmentTintColor = .orange
            
            if let path = Bundle.main.path(forResource: "hyderabad", ofType: "png") {
                do {
                    let imageData = try Data(contentsOf: URL(fileURLWithPath: path))
                    if let image = UIImage(data: imageData) {
                        img1.image = image
                    } else {
                        print("Failed to create UIImage from data")
                    }
                } catch {
                    print("Error loading image data: \(error)")
                }
            } else {
                print("Image not found in the bundle")
            }

            
            do{
                let path = Bundle.main.path(forResource: "hyderabad", ofType: "txt")
                let str = try String(contentsOfFile: path!)
                t1.text = str
            }
            catch{
                print(error.localizedDescription)
            }
            
        }
        else if index == 1{
            self.view.backgroundColor = .yellow
            seg1.selectedSegmentTintColor = .yellow
            
            if let path = Bundle.main.path(forResource: "chennai", ofType: "png") {
                do {
                    let imageData = try Data(contentsOf: URL(fileURLWithPath: path))
                    if let image = UIImage(data: imageData) {
                        img1.image = image
                    } else {
                        print("Failed to create UIImage from data")
                    }
                } catch {
                    print("Error loading image data: \(error)")
                }
            } else {
                print("Image not found in the bundle")
            }
            
            do{
                let path = Bundle.main.path(forResource: "chennai", ofType: "txt")
                let str = try String(contentsOfFile: path!)
                t1.text = str
            }
            catch{
                print(error.localizedDescription)
            }
            
        }
        else if index == 2{
            self.view.backgroundColor = .blue
            seg1.selectedSegmentTintColor = .blue
            
            if let path = Bundle.main.path(forResource: "bengaluru", ofType: "png") {
                do {
                    let imageData = try Data(contentsOf: URL(fileURLWithPath: path))
                    if let image = UIImage(data: imageData) {
                        img1.image = image
                    } else {
                        print("Failed to create UIImage from data")
                    }
                } catch {
                    print("Error loading image data: \(error)")
                }
            } else {
                print("Image not found in the bundle")
            }
            
            do{
                let path = Bundle.main.path(forResource: "bengaluru", ofType: "txt")
                let str = try String(contentsOfFile: path!)
                t1.text = str
            }
            catch{
                print(error.localizedDescription)
            }
            
        }
        
        else{
            self.view.backgroundColor = .gray
            seg1.selectedSegmentTintColor = .gray

        }
    }
 
    
//
//     @objc func changeSegments2(){
//        
//        
//        let index:Int = seg2.selectedSegmentIndex
//        lbl2.text = seg2.titleForSegment(at: index)
//        
//        if index == 0 {
//            self.view.backgroundColor = .orange
//            seg2.selectedSegmentTintColor = .orange
//            
//            if let path = Bundle.main.path(forResource: "hyderabad", ofType: "png") {
//                do {
//                    let imageData = try Data(contentsOf: URL(fileURLWithPath: path))
//                    if let image = UIImage(data: imageData) {
//                        img2.image = image
//                    } else {
//                        print("Failed to create UIImage from data")
//                    }
//                } catch {
//                    print("Error loading image data: \(error)")
//                }
//            } else {
//                print("Image not found in the bundle")
//            }
//
//            
//            do{
//                let path = Bundle.main.path(forResource: "hyderabad", ofType: "txt")
//                let str = try String(contentsOfFile: path!)
//                t2.text = str
//            }
//            catch{
//                print(error.localizedDescription)
//            }
//            
//        }
//        else if index == 1{
//            self.view.backgroundColor = .yellow
//            seg2.selectedSegmentTintColor = .yellow
//            
//            if let path = Bundle.main.path(forResource: "chennai", ofType: "png") {
//                do {
//                    let imageData = try Data(contentsOf: URL(fileURLWithPath: path))
//                    if let image = UIImage(data: imageData) {
//                        img2.image = image
//                    } else {
//                        print("Failed to create UIImage from data")
//                    }
//                } catch {
//                    print("Error loading image data: \(error)")
//                }
//            } else {
//                print("Image not found in the bundle")
//            }
//            
//            do{
//                let path = Bundle.main.path(forResource: "chennai", ofType: "txt")
//                let str = try String(contentsOfFile: path!)
//                t2.text = str
//            }
//            catch{
//                print(error.localizedDescription)
//            }
//            
//        }
//        else if index == 2{
//            self.view.backgroundColor = .blue
//            seg2.selectedSegmentTintColor = .blue
//            
//            if let path = Bundle.main.path(forResource: "bengaluru", ofType: "png") {
//                do {
//                    let imageData = try Data(contentsOf: URL(fileURLWithPath: path))
//                    if let image = UIImage(data: imageData) {
//                        img2.image = image
//                    } else {
//                        print("Failed to create UIImage from data")
//                    }
//                } catch {
//                    print("Error loading image data: \(error)")
//                }
//            } else {
//                print("Image not found in the bundle")
//            }
//            
//            do{
//                let path = Bundle.main.path(forResource: "bengaluru", ofType: "txt")
//                let str = try String(contentsOfFile: path!)
//                t2.text = str
//            }
//            catch{
//                print(error.localizedDescription)
//            }
//            
//        }
//        
//        else{
//            self.view.backgroundColor = .gray
//            seg2.selectedSegmentTintColor = .gray
//
//        }
//    }
// 
//    


}

