import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var header: UILabel!
    @IBOutlet var display: UILabel!
    
    
    @IBOutlet var name:UITextField!
    @IBOutlet var password:UITextField!
    @IBOutlet var email:UITextField!
    @IBOutlet var phonenumber:UITextField!
    @IBOutlet var city:UITextField!
    
    @IBOutlet var save:UIButton!
    @IBOutlet var submit: UIButton!
    
    
    
    var defaults1: UserDefaults!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        defaults1 = UserDefaults.standard
        
        name.text = defaults1.string(forKey:"name")
        password.text = defaults1.string(forKey:"password")
        email.text = defaults1.string(forKey:"email")
        phonenumber.text = defaults1.string(forKey:"phonenumber")
        city.text = defaults1.string(forKey:"city")

    }
    
    //when user clicks on the screen (anywhere)
        
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        name.resignFirstResponder()
        
        password.resignFirstResponder()
        
        email.resignFirstResponder()
        
        phonenumber.resignFirstResponder()
        
        city.resignFirstResponder()
    }
    
    
//    when user clicks return on keyboard
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
    
    
    @IBAction func saveButtonClick(){
        
        defaults1 = UserDefaults.standard
        
        defaults1.setValue(name.text, forKey: "name")
        defaults1.setValue(password.text, forKey: "password")
        defaults1.setValue(email.text, forKey: "email")
        defaults1.setValue(phonenumber.text, forKey: "phonenumber")
        defaults1.setValue(city.text, forKey: "city")
        
        defaults1.synchronize()
    }
    
    @IBAction func displayDetails(){
        
        display.text = " name: "+String(describing:name.text!)+"\n password: "+String(describing:password.text!)+"\n email:"+String(describing:email.text!)+"\n number :"+String(describing:phonenumber.text!)+"\n city: "+String(describing:city.text!)
    }

}


