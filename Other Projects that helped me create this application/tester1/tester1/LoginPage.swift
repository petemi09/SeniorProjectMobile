//
//  LoginPage.swift
//  tester1
//
//  Created by Mitchell Petellin on 3/28/19.
//  Copyright © 2019 Mitchell Petellin. All rights reserved.
//

import UIKit
import Parse

class LoginPage: UIViewController {

    @IBAction func pullHistory(_ sender: Any) {
        let query1 = PFQuery (className: "records")
        query1.findObjectsInBackground { (try1,error1) -> Void in
            if let types = try1 {
                for races in types {
                    print(races)
                }
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
