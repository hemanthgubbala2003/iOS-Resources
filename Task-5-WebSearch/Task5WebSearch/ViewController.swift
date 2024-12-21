//
//  ViewController.swift
//  Task5WebSearch
//
//  Created by FCI on 27/11/24.
//

import UIKit
import WebKit
import SafariServices

class ViewController: UIViewController {

    @IBOutlet var tf1:UITextField!
    @IBOutlet var wkv1:WKWebView!
    @IBOutlet var bt1:UIButton!
    
    var url1:URL!
    var request1:URLRequest!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func searchURL(){
        let alert = UIAlertController(title: "Web Search", message: "Please Select an Option", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Safari Web View", style: .default, handler:{ _ in
            
            
            self.url1 = URL(string: String(self.tf1.text!))
            let safariVC = SFSafariViewController(url: self.url1)
            self.present(safariVC,animated: true,completion: nil)
            print("User Click Approve button")
        }))
        
        alert.addAction(UIAlertAction(title: "Web Kit View", style: .default, handler:{ _ in
            
            self.url1 = URL(string: String(self.tf1.text!))
            self.request1 = URLRequest(url: self.url1)
            self.wkv1.load(self.request1)
            
            print("User Click Edit button")
        }))
        
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler:{ _ in print("User Click Dismiss button")
        }))
    
        
        self.present(alert, animated: true, completion: nil)
        
    }


}

