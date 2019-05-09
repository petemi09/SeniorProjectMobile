//
//  ViewController.swift
//  table
//
//  Created by Mitchell Petellin on 4/19/19.
//  Copyright © 2019 Mitchell Petellin. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBAction func btn(_ sender: Any) {
        //let searchName = userTextField.text as! String
        
        //let userString = "name = '" + searchName + "'"
        let userString = "name = 'Mitchell'"
        let predicate = NSPredicate(format: userString)
        let query = PFQuery (className: "records", predicate: predicate)
        query.findObjectsInBackground { (success2, error2) -> Void in
            if error2 == nil {
                print(success2?.last)
            }
        }
    }
    
    @IBOutlet weak var tableViewController: UITableView!
    
    var dataInfo: info!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataInfo = info()
        tableViewController.dataSource = self
        tableViewController.delegate = self
        //dataInfo.downloadDetails {
            //pulls
        //}
        // Do any additional setup after loading the view, typically from a nib.
    }
    
//    func downloadData(completed: downloadComplete) {
//
//    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "timerCell", for: indexPath)
        return cell
    }
    
    


}

