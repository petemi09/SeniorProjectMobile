//
//  recordsV2VC.swift
//  SeniorProject
//
//  Created by Mitchell Petellin on 4/19/19.
//  Copyright © 2019 Mitchell Petellin. All rights reserved.
//

import UIKit
import Parse

class recordsV2VC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var dates = [String]()
    var distances = [String]()
    var names = [String]()
    var times = [String]()
    var totals = [String]()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var userTextField1: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        tableView.dataSource = self
        tableView.delegate = self

    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return names.count//names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recordsCell", for: indexPath) as! RV2cells
        
        cell.NameLabel.text = "Name: \(names.reversed()[indexPath.row])"
        //cell.SchoolLabel.text = "School: \(school[indexPath.row])"
        cell.RaceLabel.text = "Race: \(distances.reversed()[indexPath.row])"
        cell.DateLabel.text = dates.reversed()[indexPath.row]
        cell.SplitLabel.text = times.reversed()[indexPath.row]
        cell.TotalLabel.text = "Total Time: \(totals.reversed()[indexPath.row])"
        return cell
    }

    
    func findUsers() {
        let searchName = userTextField1.text as! String
        let userString = "name = '" + searchName + "'"
        let predicate = NSPredicate(format: userString)
        let query = PFQuery (className: "records", predicate: predicate)
        query.findObjectsInBackground { (objects: [PFObject]?, error: Error?) in
            if let error = error {
                // Log details of the failure
                print(error.localizedDescription)
            } else if let objects = objects {
                if objects.count == 0 {
                    //put error no athlete name like that
                    let alertController = UIAlertController(title: "Alert", message: "There is no user with that name, check spleeing", preferredStyle: .alert)
                    let cancelAction = UIAlertAction(title: "Dismiss", style: .cancel) { (action:UIAlertAction!) in
                        //print("cancel button tapped");
                    }
                    alertController.addAction(cancelAction)
                    self.present(alertController, animated: true, completion: nil)
                }
                print(objects.last)
                for diff_items in objects {
                    let place_holder_date = diff_items["date"] as! String
                    let place_holder_distance = diff_items["distance"] as! String
                    let place_holder_name = diff_items["name"] as! String
                    
                    
                    //this one gets changed if the value is an empty String
                    var place_holder_time = diff_items["time"] as! String
                    let place_holder_total = diff_items["total"] as! String
                    
                    self.dates.append(place_holder_date)
                    self.distances.append(place_holder_distance)
                    self.names.append(place_holder_name)
                    if place_holder_time == "" {
                        print("It was none")
                        place_holder_time += "  There were no split times"
                    } else {
                        print(place_holder_time)
                    }
                    self.times.append(place_holder_time)
                    self.totals.append(place_holder_total)
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    @IBAction func searchBTN(_ sender: Any) {
        
        findUsers()
        dates = []
        distances = []
        names = []
        times = []
        totals = []
        print("underneath")
        print("TEST!")
        print("------")
        print("------")
        print("------")
        let date = NSDate()
        print(date)
        let today = Date()
        let nextDate = Calendar.current.date(byAdding: .day, value: -1, to: today)
        //print(today)
        print(nextDate)
        print("------")
        print("------")
        print("------")
        print("yourButton was pressed")
    }
}


