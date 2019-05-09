//
//  TableViewCell.swift
//  t21
//
//  Created by Mitchell Petellin on 4/23/19.
//  Copyright © 2019 Mitchell Petellin. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var lable1: UILabel!
    @IBOutlet weak var lable2: UILabel!
    
    func configureCell(data: ViewController) {
        lable1.text = "\(data.name)"
    }


}
