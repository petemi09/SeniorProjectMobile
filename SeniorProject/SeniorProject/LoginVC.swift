//
//  LoginVC.swift
//  SeniorProject
//
//  Created by Mitchell Petellin on 4/13/19.
//  Copyright © 2019 Mitchell Petellin. All rights reserved.
//

import UIKit
import Parse
import BCryptSwift
import SVProgressHUD

class LoginVC: UIViewController {

    @IBOutlet weak var UsernameTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var LoginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func LoginBtn(_ sender: Any) -> Void {
        SVProgressHUD.show(withStatus: "Loading")
        if (PasswordTextField.text?.isEmpty)! || (UsernameTextField.text?.isEmpty)! {
            let alertController = UIAlertController(
                title: "Alert",
                message: "Whoops something went wrong. Please check all fields are filled.",
                preferredStyle: .alert
            )
            let cancelAction = UIAlertAction(title: "Hide", style: .cancel) { (action:UIAlertAction!) in
                //print("Cancel button tapped");
            }
            alertController.addAction(cancelAction)
            present(alertController, animated: true, completion: nil)
            SVProgressHUD.dismiss()
        } else {
            let userName1 = UsernameTextField.text
            let userString1 = "username = '" + userName1! + "'"
            let predicate2 = NSPredicate(format: userString1)
            let query2 = PFQuery (className: "users", predicate: predicate2)
            query2.findObjectsInBackground { (success3, error3) -> Void in
                if let user = success3 {
                   
                    for userVal in user {
                        print(userVal["username"])
                        print(userVal["password"])
                        print("*******")
                        //let newStr2 =
                        let newStr2 = String(data: (userVal["password"] as! NSData) as Data, encoding: .utf8)
                        
                        print("this is a test ", newStr2)
                        print(type(of: newStr2))
                        if let compare = BCryptSwift.verifyPassword(self.PasswordTextField.text!, matchesHash: (newStr2 as! String)) {
                            if compare {
                                self.performSegue(withIdentifier: "LoginSegue", sender: self)
                                break
                            } else {
                                let alertController2 = UIAlertController(
                                    title: "Alert",
                                    message: "Whoops, that password doesn't match. Please re-enter password",
                                    preferredStyle: .alert
                                )
                                let cancelAction = UIAlertAction(title: "Hide", style: .cancel) { (action:UIAlertAction!) in
                                }
                                alertController2.addAction(cancelAction)
                                self.present(alertController2, animated: true, completion: nil)
                                SVProgressHUD.dismiss()
                            }
                        }
                    }
                    let alertController2 = UIAlertController(
                        title: "Alert",
                        message: "Whoops, that username doesn't exsist",
                        preferredStyle: .alert
                    )
                    let cancelAction = UIAlertAction(title: "Hide", style: .cancel) { (action:UIAlertAction!) in
                    }
                    alertController2.addAction(cancelAction)
                    self.present(alertController2, animated: true, completion: nil)
                    SVProgressHUD.dismiss()
                }
            }
            
        }
    }

}
