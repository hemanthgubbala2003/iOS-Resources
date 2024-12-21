//
//  ViewController.swift
//  Coding-2-Assignment-2
//
//  Created by FCI on 28/11/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var iv1: UIImageView!
    @IBOutlet var tv1: UITextView!
    @IBOutlet var label1: UILabel!
    
    var name:String!
    var image1:UIImage!
    var imageFileName:String!
    var textFileName:String!
    var number:Int!
    var urls:[String] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        label1.text = name
        urls = ["https://www.onceuponachef.com/images/2023/08/Frittata-1-13.jpg","https://dishingouthealth.com/wp-content/uploads/2022/12/GarlicParmesanCauliflower_Styled1.jpg","https://cdn.loveandlemons.com/wp-content/uploads/2023/02/vegan-ramen-recipe.jpg","https://saltedmint.com/wp-content/uploads/2024/02/Shakshuka-Eggs-1.jpg","https://hips.hearstapps.com/hmg-prod/images/singleimagebug-chicken-shawarma-pin-1657722687.jpg","https://www.spoonforkbacon.com/wp-content/uploads/2021/02/Lamb_kofta.jpg"]
//        if let path = Bundle.main.path(forResource: textFileName, ofType: "png") {
//            do {
//                let imageData = try Data(contentsOf: URL(fileURLWithPath: path))
//                if let image2 = UIImage(data: imageData) {
//                    iv1.image = image2
//                } else {
//                    print("Failed to create UIImage from data")
//                }
//            } catch {
//                print("Error loading image data: \(error)")
//            }
//        } else {
//            print("Image \(textFileName!) not found in the bundle")
//        }
        
        let url = URL(string:urls[number])!
        //print(imageFileName!)
        //iv1.image = UIImage(named: imageFileName!)
      
        
        DispatchQueue.global().async{
            if let data = try? Data(contentsOf: url){
                DispatchQueue.main.async{
                    print("\(data)")
                    self.iv1.image = UIImage(data: data)
                }
            }
                
        }

        
        do{
            let path = Bundle.main.path(forResource: textFileName, ofType: "txt")
            let str1 = try String(contentsOfFile: path!)
            tv1.text = str1
        }
        catch{
            print(error.localizedDescription)
        }
        


    }
    
    


}

