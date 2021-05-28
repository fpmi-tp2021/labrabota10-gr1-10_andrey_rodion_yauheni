
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var passwordRegField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var loginRegFiled: UITextField!
    @IBOutlet weak var registrationView: UIView!
    @IBOutlet weak var loginControl: UISegmentedControl!
    
    @IBOutlet var current: UIView!
    @IBOutlet weak var loginField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        registrationView.isHidden = true;
    }
   
    @IBSegueAction func loginTransition(_ coder: NSCoder) -> UIViewController? {
        let user = UserDefaults.standard
        if loginRegFiled.hasText && passwordRegField.hasText {
            if user.object(forKey: "password") != nil && user.object(forKey: "login") != nil{
                return UIViewController(coder: coder)
            }
        }
        return current.inputViewController;
    }
   
    
    @IBAction func segmentStateChanged(_ sender: Any) {
        let selectedSegment = loginControl.selectedSegmentIndex
        registrationView.isHidden = selectedSegment == 0
    }
    
    @IBAction func registerButtonPressed(_ sender: Any) {
        
        if loginRegFiled.hasText && passwordRegField.hasText {
                    let user = UserDefaults.standard;
                    user.set(loginRegFiled.text, forKey: "login")
                    user.set(passwordRegField.text, forKey: "password")
        }
    }
}

