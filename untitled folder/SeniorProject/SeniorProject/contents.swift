//
//  contents.swift
//  SeniorProject
//
//  Created by Mitchell Petellin on 4/3/19.
//  Copyright © 2019 Mitchell Petellin. All rights reserved.
//

import UIKit
import Parse

class contents {
    let MVC =  RecordsVC()
    
    var _name: String!
    var _distance: String!
    var _time: String!
    var _total: String!
    
    var name: String {
        if _name == nil {
            _name = ""
        }
        return _name
    }
    var distance: String {
        if _distance == nil {
            _distance = ""
        }
        return _distance
    }
    var time: String {
        if _time == nil {
            _time = ""
        }
        return _time
    }
    var total: String {
        if _total == nil {
            _total = ""
        }
        return _total
    }
    
    func downloadData(completed: @escaping DownloadComplete) {
        let query = PFQuery (className: "records")
        query.findObjectsInBackground { (successFul, errorFull) in
            if errorFull == nil {
                //let results = successFul
                //print(results)
                print(successFul)
            }
            completed()
        }
        
        
    }
    
    
}
