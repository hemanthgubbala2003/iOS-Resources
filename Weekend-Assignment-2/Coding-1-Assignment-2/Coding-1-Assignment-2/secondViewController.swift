//
//  secondViewController.swift
//  Coding-1-Assignment-2
//
//  Created by FCI on 28/11/24.
//

import UIKit
import WebKit

class secondViewController: UIViewController {

    @IBOutlet var wkv1:WKWebView!
    
    var urlstring:String!
    var url1:URL!
    var request1:URLRequest!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        url1 = URL(string:urlstring)
        request1 = URLRequest(url: url1)
        wkv1.load(request1)

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
