//
//  ViewController.swift
//  Task-7-Image-Sharing-App
//
//  Created by FCI on 02/12/24.
//

import UIKit
import QuartzCore

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
//   Declare UI Objects
    @IBOutlet var label:UILabel!
    @IBOutlet var textField1: UITextField!
    @IBOutlet var textField2: UITextField!
    
    @IBOutlet var imageView1: UIImageView!
    
    @IBOutlet var add1: UIButton!
    @IBOutlet var share1: UIButton!
    
//  Photo Library and Camera Image Picker
    var plip1:UIImagePickerController!
    var cip2: UIImagePickerController!
    
//  Declare animation layers to the UI Objects
    var textFieldLayer: CALayer!
    var imageViewLayer: CALayer!
    var screenViewLayer: CALayer!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        let textFields = [textField1,textField2]

        for textField in textFields {
            textFieldLayer = textField?.layer
            textFieldLayer.masksToBounds = true
            textFieldLayer.borderColor = UIColor.black.cgColor
            textFieldLayer.borderWidth = 2.5
            textFieldLayer.cornerRadius = 10
        }
        
        imageViewLayer = imageView1.layer
        imageViewLayer.borderColor  = UIColor.black.cgColor
        imageViewLayer.borderWidth = 2.5
        imageViewLayer.cornerRadius = 15
        imageViewLayer.shadowRadius = 100
        imageViewLayer.shadowColor = UIColor.black.cgColor


        
        screenViewLayer = self.view.layer
        screenViewLayer.borderColor = UIColor.darkGray.cgColor
        screenViewLayer.borderWidth = 10
        screenViewLayer.cornerRadius = 50
    }
    
    
    @IBAction func addImage(){
        
        let alertController1 = UIAlertController(title: "Image Selection", message: "Pick an Image ", preferredStyle: .actionSheet)
        
//        Pick Image from Photo Library
        alertController1.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { UIAlertAction in
            print("Photo Gallery")
             
            self.plip1 = UIImagePickerController()
            self.plip1.sourceType = .photoLibrary
            self.plip1.delegate = self
            self.plip1.allowsEditing = true
                
            self.present(self.plip1, animated: true)
            
            
        }))
        
//        Pick Image from camera
        alertController1.addAction(UIAlertAction(title: "Camera", style: .default, handler: { UIAlertAction in
            print("Camera")
            
            if(UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera)){
                self.cip2 =  UIImagePickerController()
                self.cip2.delegate = self
                self.cip2.sourceType = .camera
                self.cip2.cameraDevice = .rear
                self.cip2.allowsEditing = true
                
                self.present(self.cip2,animated: true)
            }
            else{
                print("camera not found")
            }
        }))
        
        alertController1.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: { UIAlertAction in
            print("Cancel")
            
        }))
        
        self.present(alertController1, animated: true, completion: nil)
    }
    
    @IBAction func shareImage(){
        
        let text = textField1.text
        let image1 = imageView1.image
        let mywebsite = textField2.text
        
        
        let shareAll = [text, image1!, mywebsite!] as [Any]

        print(shareAll)
        
        let activityViewController = UIActivityViewController(activityItems: shareAll, applicationActivities: nil)
      
        activityViewController.popoverPresentationController?.sourceView = self.view
        
        self.present(activityViewController, animated: true)
    }
    
    
    @objc func image(_ image:UIImage, didFinishSavingWithError error:Error?,contextInfo:UnsafeRawPointer){
        if let error = error{
            let ac = UIAlertController(title: "save error", message: error.localizedDescription, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
        else{
            let ac = UIAlertController(title: "Saved", message: "Altered Image saved", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
//        Display the selected Image
        if picker == plip1 {
            print(" Selected Image :\(info)" )
            
            let image1 = info [.originalImage] as! UIImage
            
            imageView1.image = image1
            
            self.dismiss(animated: true, completion: nil)
        }
        
//        Save the edited image and then display it
        else{
            print(" Selected Image :\(info)" )
            
            let image2 = info [.editedImage] as! UIImage
            
            imageView1.image = image2
            
            UIImageWriteToSavedPhotosAlbum(imageView1.image!, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
            
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        if picker == plip1{
            self.dismiss(animated: true)
        }
        else{
            self.dismiss(animated: true)
        }
    }
}

