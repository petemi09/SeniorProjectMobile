//
//  ViewController.swift
//  tester1
//
//  Created by Mitchell Petellin on 3/24/19.
//  Copyright © 2019 Mitchell Petellin. All rights reserved.
//

import UIKit
import Parse
import BCryptSwift



class ViewController: UIViewController {
    
    
    @IBOutlet weak var checkUser: UITextField!
    @IBOutlet weak var checkPassword: UITextField!
    
    
    
    @IBOutlet weak var TextField1: UITextField!
    @IBOutlet weak var PassWord: UITextField!
    @IBOutlet weak var label1: UILabel!
    
    
    @IBOutlet weak var UserName: UITextField!
    @IBOutlet weak var PassWordCheck: UITextField!
    @IBOutlet weak var Label2: UILabel!
    
    
    
    @IBOutlet weak var userNameHashTextField: UITextField!
    @IBOutlet weak var saltInputTextField: UITextField!
    @IBOutlet weak var hashTextFeild: UITextField!
    @IBAction func hashButton(_ sender: Any) {
        if let hash = BCryptSwift.hashPassword(self.hashTextFeild.text!, withSalt: self.generateSalt()) {
                print(hash)
            let sender = PFObject (className: "users")
            sender["username"] = userNameHashTextField.text
            sender["password"] = hash
            sender.saveInBackground { (success0, error0) in
                if success0 {
                    print("wohoo")
                } else {
                    print("fail")
                }
            }
            //self.hashLabelField.text = hash
        }
    }
    
    
    @IBAction func ButtonGo(_ sender: Any) {
        label1.isHidden = false
        let object = PFObject (className: "users")
        object["username"] = TextField1.text
        object["password"] = PassWord.text
        object.saveInBackground { (success, error1) in
            if success {
                self.label1.text = String("worked")
            } else {
                self.label1.text = String("Error")
            }
            
        }
    }
    
    
    @IBAction func GetLogin(_ sender: Any) {
        let userPassword = PassWordCheck.text
        let userName = UserName.text
        let userString = "username = '" + userName! + "'"
        let predicate = NSPredicate(format: userString)
        let query = PFQuery (className: "users", predicate: predicate)
        query.findObjectsInBackground { (success2, error2) -> Void in
            if error2 == nil {
                if let foo = success2 {
                    for foop in foo {
                        if (foop["username"] as! String) == userName && (foop["password"] as! String) == userPassword {
                            print("it Worked")
                        } else {
                            print("it failed")
                        }
                        
                    }
                }
                
            }
            
        }
    }
    
    
    
    
    @IBAction func checkUserAndPass(_ sender: Any) {
        let userName1 = checkUser.text
        let userString1 = "username = '" + userName1! + "'"
        let predicate2 = NSPredicate(format: userString1)
        let query2 = PFQuery (className: "users", predicate: predicate2)
        query2.findObjectsInBackground { (success3, error3) -> Void in
            if let user = success3 {
                for userVal in user {
                    //let newStr = String(data: data, encoding: .utf8) StackOverflow
                    let newStr = String(data: userVal["password"] as! Data, encoding: .utf8)
                    //print(newStr as! String)
                    //print(userVal!["password"] as! NSString)
                    if let compare = BCryptSwift.verifyPassword(self.checkPassword.text!, matchesHash: (newStr as! String)) {
                        if compare {
                            print("The phrase was a SUCCESS!")
                    } else {
                        print("failed")
                        }
                    }
                    }
                }
            }
        
        
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        label1.isHidden = true
        Label2.isHidden = true
    }
    
    func generateSalt() -> String {
        let rounds : Int? = Int(self.saltInputTextField.text!)
        
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
