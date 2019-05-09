//
//  backupVC.swift
//  SeniorProject
//
//  Created by Mitchell Petellin on 4/4/19.
//  Copyright © 2019 Mitchell Petellin. All rights reserved.
//

import UIKit
import Parse
import SVProgressHUD

class backupVC: UIViewController {

    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var raceLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var timesLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var labelLabel: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var schoolLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.isHidden = true
        raceLabel.isHidden = true
        distanceLabel.isHidden = true
        splitLabel.isHidden = true
        timesLabel.isHidden = true
        totalLabel.isHidden = true
        labelLabel.isHidden = true
        schoolLable.isHidden = true
        date.isHidden = true
    }

    @IBAction func searchBtn(_ sender: Any) {
        SVProgressHUD.show(withStatus: "Loading")
        
        let userName1 = self.userTextField.text as! String
        let userString1 = "username = '" + userName1 + "'"
        let predicate2 = NSPredicate(format: userString1)
        let query2 = PFQuery (className: "users", predicate: predicate2)
        query2.findObjectsInBackground { (success3, error3) -> Void in
            if let user = success3 {
                
                for userVal in user {
                    //print(userVal["username"])
                    //print(userVal["password"])
                    //print(userVal["school"])
                }
            }
        }
//                if data2!["school"] != nil {
//                    self.schoolLable.text = data2!["school"] as? String
//                    self.schoolLable.isHidden = false
//                    print("TEST!")
//                } else {
//                    self.schoolLable.isHidden = true
//                    print("FAILED!")
//                }
         
            
        let searchName = self.userTextField.text as! String
        let userString = "name = '" + searchName + "'"
        let predicate = NSPredicate(format: userString)
        let query = PFQuery (className: "records", predicate: predicate)
        query.findObjectsInBackground { (success2, error2) -> Void in
            if error2 == nil {
                print("test1")
                print(success2?.last)
                SVProgressHUD.dismiss()
                
                let data = success2?.last
                self.nameLabel.isHidden = false
                self.nameLabel.text = data!["name"] as? String
                self.raceLabel.isHidden = false
                
                if data!["date"] != nil {
                    self.date.text = data!["date"] as? String
                    self.date.isHidden = false
                } else {
                    self.date.isHidden = true
                }
                
                
                
                
                self.distanceLabel.text = data!["distance"] as? String
                self.distanceLabel.isHidden = false
                self.splitLabel.isHidden = false
                self.totalLabel.isHidden = false
                self.timesLabel.text = data!["time"] as? String
                self.timesLabel.isHidden = false
                self.labelLabel.text = data!["total"] as? String
                self.labelLabel.isHidden = false

            }
        }
    }
}
