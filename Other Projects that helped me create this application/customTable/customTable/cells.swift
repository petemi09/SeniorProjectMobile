//
//  cells.swift
//  customTable
//
//  Created by Mitchell Petellin on 4/2/19.
//  Copyright © 2019 Mitchell Petellin. All rights reserved.
//

import UIKit

class cells: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    @IBAction func button1(_ sender: Any) {
        print("hello")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
