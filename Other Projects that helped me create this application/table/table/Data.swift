//
//  Data.swift
//  table
//
//  Created by Mitchell Petellin on 4/19/19.
//  Copyright © 2019 Mitchell Petellin. All rights reserved.
//


import Foundation
import Parse

class info {
    var _name: String!
    
    
    var name: String {
        if _name == nil {
            _name = ""
        }
        return _name
    }
    
    func downloadDetails(completed: downloadComplete) {
//        let searchName = userTextField.text as! String
//        let userString = "name = '" + searchName + "'"
//        let predicate = NSPredicate(format: userString)
//        let query = PFQuery (className: "records", predicate: predicate)
//        query.findObjectsInBackground { (success2, error2) -> Void in
//            if error2 == nil {
//                print(success2?.last)
        
        // get data
        let searchName = "Patrick"
        let userString = "name = '" + searchName + "'"
        let predicate = NSPredicate(format: userString)
        //let query = PFQuery (className: "records", predicate: predicate)
        let query = PFQuery (className: "records")
        
        query.findObjectsInBackground { (success, error) -> Void in
            if error == nil {
                if let objects = success {
                    for obj in objects {
                        print(obj["name"] as! String)
                    }
                }
                //print(success)
            }
        }
        completed()
    }
}
