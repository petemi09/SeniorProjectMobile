//
//  NewUserVC.swift
//  SeniorProject
//
//  Created by Mitchell Petellin on 4/13/19.
//  Copyright © 2019 Mitchell Petellin. All rights reserved.
//

import UIKit
import Parse
import SVProgressHUD
import BCryptSwift

class NewUserVC: UIViewController {

    @IBOutlet weak var UsernameTextField: UITextField!
    @IBOutlet weak var FirstnameTextField: UITextField!
    @IBOutlet weak var LastnameTextField: UITextField!
    
    
    @IBOutlet weak var schoolNameTextField: UITextField!
    
    
    
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var CheckPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
//    @IBAction func CreateNewUserSVProgress(_ sender: Any) {
//    }
   override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {

        //SVProgressHUD.showSuccess(withStatus: "New User Created!")
        if identifier == "segue1" {
            if (PasswordTextField.text?.isEmpty)! || (UsernameTextField.text?.isEmpty)! || (FirstnameTextField.text?.isEmpty)! || (schoolNameTextField.text?.isEmpty)! || (LastnameTextField.text?.isEmpty)! || PasswordTextField.text != CheckPasswordTextField.text {
                let alertController = UIAlertController(
                    title: "Alert",
                    message: "Whoops something went wrong. Please check all fields are filled and passwords match",
                    preferredStyle: .alert
                )
                let cancelAction = UIAlertAction(title: "Hide", style: .cancel) { (action:UIAlertAction!) in
                            //print("Cancel button tapped");
                    }
                alertController.addAction(cancelAction)
                present(alertController, animated: true, completion: nil)
                return false
            }
            //above provides one error if password was empty or they didn't match
            
            
            var hash: String!
            hash = BCryptSwift.hashPassword(self.PasswordTextField.text!, withSalt: self.generateSalt())
            print("*****************")
            
            //let hash3 = String(data: (hash as! NSData) as Data, encoding: .utf8)
            //let hash3 = String(data: (hash as! Data), encoding: .utf8)
            let binaryData = Data(hash.utf8)
            print(binaryData)
            //print(hash3!)
            //print(type(of: binaryData))
            //let binaryData1: Data? = hash.data(using: .utf8, allowLossyConversion: false)
            //let hash2 = NSString(string: hash)
            //print(binaryData1)
            let object = PFObject (className: "users")
            object["username"] = (UsernameTextField.text)//?.data(using: .utf8)
            object["firstname"] = (FirstnameTextField.text)//?.data(using: .utf8)
            object["lastname"] = (LastnameTextField.text)//?.data(using: .utf8)
            object["school"] = (schoolNameTextField.text)
            //object["password"] = hash //(hash).encode(to: PFEncoder.self as! Encoder)
            object["password1"] = binaryData
            object["password"] = binaryData
            object.saveInBackground { (success, error1) in
                if success {
                    print("sent")

                } else {
                    print(error1 as Any)
                }
            }
        }
        print("test2")
        return true
    }
    
    
    
    func generateSalt() -> String {
        
        let rounds : Int? = nil//8 or //Int(self.saltInputTextField.text!)
        
        var salt : String
        if rounds != nil && rounds! >= 4 && rounds! <= 31 {
            salt = BCryptSwift.generateSaltWithNumberOfRounds(UInt(rounds!))
        }
        else {
            salt = BCryptSwift.generateSalt()
        }
        
        return salt
    }
    
    
}
