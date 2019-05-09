//
//  ViewController.swift
//  t21
//
//  Created by Mitchell Petellin on 4/2/19.
//  Copyright © 2019 Mitchell Petellin. All rights reserved.
//

import UIKit
import Parse



class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableViewController: UITableView!
    @IBOutlet weak var userTextField: UITextField!
    
    
    var _name: String!
    //var numberOfTimes = 0
    func numberOfTimes(){
        let start: Int = 0
    }
    
    var name: String {
        if _name == nil {
            _name = ""
        }
        return _name
    }
    
    
    var dataInfo: Secondary!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewController.dataSource = self
        tableViewController.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {


        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "timerCell", for: indexPath)
        return cell
    }
    
    @IBAction func btn1(_ sender: Any) {
        
        dataInfo = Secondary()
                //let searchName = "test test"
        let searchName = self.userTextField.text!
        let userString = "name = '" + searchName + "'"
        let predicate = NSPredicate(format: userString)
        let query = PFQuery (className: "records", predicate: predicate)
        query.findObjectsInBackground { (success2, error2) -> Void in
            if error2 == nil {
                //print(success2?.last)
                print("start")
                print(type(of: success2))
                var dict = [String: String]()
                if let obj = success2 {
                    for item in obj {
                        dict["name"] = item["name"] as! String
                        dict["distance"] = item["distance"] as! String
                        //return self.numberOfTimes
                    }
                print(dict)
                    
                }
            }
        }
    }
}

