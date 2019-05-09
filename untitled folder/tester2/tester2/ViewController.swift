//
//  ViewController.swift
//  tester2
//
//  Created by Mitchell Petellin on 3/9/19.
//  Copyright © 2019 Mitchell Petellin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var changingLabel: UILabel!
    private let networking1 = networking()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func execute(_ sender: Any) {
        //guard let urlToExecute = URL(string: "http://jsonplaceholder.typicode.com/posts/1") else {
        guard let urlToExecute = URL(string: "https://api.mlab.com/api/1/databases/track_database/collections/users?apiKey=rd2umKDRTGc9iHxgkIJXnwTaiz8m0Gfj") else {
            return
        }
        networking1.execute1(urlToExecute) { (json, error) in
            if let error = error {
                self.textView.text = error.localizedDescription
            } else if let json = json {
                
                self.textView.text = json.description
                self.changingLabel.text = json.description
                
            }
        }
    }
    
    
}

