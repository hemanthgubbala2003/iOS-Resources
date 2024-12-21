//
//  ViewController.swift
//  ImageView
//
//  Created by FCI on 25/11/24.
//

import UIKit

class ViewController: UIViewController {

    
//    @IBOutlet var iv1: UIImageView!
    @IBOutlet var pc1: UIPageControl!
    @IBOutlet var iv1:UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }
    
    @IBAction func changeImage(){
        
        
        let index: Int = pc1.currentPage
        
        if index == 0 {
            iv1.image = UIImage(systemName: "pencil")
        }
        else if index == 1{
            
            
            iv1.image = UIImage(systemName: "eraser")
            
        }
        else if index == 2{
            
            iv1.image = UIImage(systemName: "scribble")
       
        }
        else if index == 3{
            
            iv1.image = UIImage(systemName: "trash")
       
        }
        else{

            iv1.image = UIImage(systemName: "pencil.circle")
        }
        
    
        
    }
    
    
}

