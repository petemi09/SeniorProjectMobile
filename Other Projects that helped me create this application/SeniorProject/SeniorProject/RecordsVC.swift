//
//  RecordsVC.swift
//  SeniorProject
//
//  Created by Mitchell Petellin on 4/3/19.
//  Copyright © 2019 Mitchell Petellin. All rights reserved.
//

import UIKit
import Parse
import SVProgressHUD

class RecordsVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let dataStuff: String = ""
    
    
    
    
    
    @IBOutlet weak var recordsTextFeild: UITextField!
    @IBOutlet weak var tableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recordsCell", for: indexPath)
        
        
        return cell
    }
    
    
    
    
    
    @IBAction func SearchButton(_ sender: Any) {
        SVProgressHUD.show(withStatus: "Loading")
        let searchName = recordsTextFeild.text as! String
        let userString = "name = '" + searchName + "'"
        let predicate = NSPredicate(format: userString)
        let query = PFQuery (className: "records", predicate: predicate)
        query.findObjectsInBackground { (success2, error2) -> Void in
            if error2 == nil {
                print(success2)
                SVProgressHUD.dismiss()
                
                
                
//                if let foo = success2 {
//                    for foop in foo {
//
//                        if (foop["name"] as! String) == searchName {
//                            SVProgressHUD.dismiss()
//                            print(foop["name"] as! String)
//                            print(foop["times"] as! String)
//                            print("it Worked")
//                        } else {
//                            print("it failed")
//                        }
//                        }
//                    }
                }

            }

        }
    
    
    

}
