//
//  ViewController.swift
//  SeniorProject
//
//  Created by Mitchell Petellin on 3/28/19.
//  Copyright © 2019 Mitchell Petellin. All rights reserved.
//

import UIKit
import Parse
import BCryptSwift

class ViewController: UIViewController {
    
    //@IBOutlet weak var usernameTextfield: UITextField!
    //@IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func loginButton(_ sender: Any) {
        
        
        print("pushed")
        let var1 = usernameTextfield.text
        
        
        let userString1 = "username = '" + var1! + "'"
        
        print(userString1)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
}

