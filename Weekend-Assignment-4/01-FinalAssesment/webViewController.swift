//
//  webViewController.swift
//  01-FinalAssesment
//
//  Created by FCI on 12/12/24.
//

import UIKit
import WebKit

class webViewController: UIViewController {
    
    // Declare UI Objects for user interaction
    @IBOutlet var webKitView1:WKWebView!
    
    // Home button
    var homeButton:UIBarButtonItem!
    
    // Variables to send a Http Request to URL
    var url2:URL!
    var request2:URLRequest!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeButton = UIBarButtonItem(image: UIImage(systemName: "homekit"), style: .plain, target: self, action: #selector(homeButtonClick))
        
        self.navigationItem.rightBarButtonItem = homeButton
        print("\(url2) \(request2)")
        self.webKitView1.load(self.request2)

    }
    
    // This funtion sends the user to root screen
     @objc func homeButtonClick() {
        
        self.navigationController?.popToRootViewController(animated: true)
        
    }
    


}
