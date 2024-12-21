//
//  ViewController.swift
//  WebKitViewApp
//
//  Created by FCI on 25/11/24.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet var webKitView1: WKWebView!
    @IBOutlet var seg1:UISegmentedControl!
    

    var url1:URL!
    var request1: URLRequest!
    
    
    var url2:URL!
    var request2: URLRequest!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        webKitView1.frame = CGRect(x: 200, y: 300, width: 300, height: 35)
        
        
    }
    
    @IBAction func viewScreen(){
        
        let currentPage:Int = seg1.selectedSegmentIndex
        
        if currentPage == 0 {
            url1 = URL(string: "https://www.apple.com")
            
            request1 = URLRequest(url: url1)
            
            webKitView1.load(request1)
        }
        else if currentPage == 1{
            url1 = URL(string: "https://www.linkedin.com")
            
            request1 = URLRequest(url: url1)
            
            webKitView1.load(request1)
        }
        else if currentPage == 2{
            url1 = URL(string: "https://www.google.com")
            
            request1 = URLRequest(url: url1)
            
            webKitView1.load(request1)
        }
        else{
            url1 = URL(string: "https://www.twitter.com")
            
            request1 = URLRequest(url: url1)
            
            webKitView1.load(request1)
        }
    }
    

    
}

