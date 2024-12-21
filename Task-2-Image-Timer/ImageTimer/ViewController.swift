//
//  ViewController.swift
//  ImageTimer
//
//  Created by FCI on 25/11/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var av1:UIActivityIndicatorView!
    @IBOutlet var iv1:UIImageView!
    var timer1: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        av1.startAnimating()
        
        timer1 = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(stopTimer1), userInfo: nil, repeats: false)

    }
    
    @objc func stopTimer1(){
        
        av1.stopAnimating()
        av1.hidesWhenStopped = true
        
        iv1.image = UIImage(systemName: "pencil")
        self.view.backgroundColor = .orange
    }
    
    
    


}

