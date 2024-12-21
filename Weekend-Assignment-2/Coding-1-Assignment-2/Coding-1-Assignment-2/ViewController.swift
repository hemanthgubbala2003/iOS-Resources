//
//  ViewController.swift
//  Coding-1-Assignment-2
//
//  Created by FCI on 28/11/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tf1: UITextField!
    @IBOutlet var tf2: UITextField!
    
    @IBOutlet var bt1: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btn1OnClick(){
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        let nextScreen = segue.destination as! secondViewController
        
        nextScreen.navigationItem.title = tf1.text
        nextScreen.urlstring = tf2.text
    }
    


}

