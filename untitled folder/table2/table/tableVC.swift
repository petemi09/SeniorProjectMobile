//
//  ViewController.swift
//  table
//
//  Created by Mitchell Petellin on 4/2/19.
//  Copyright © 2019 Mitchell Petellin. All rights reserved.
//

import UIKit

class tableVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBAction func button1(_ sender: Any) {
        print("pressed")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath)
        
        return cell
    }

}
