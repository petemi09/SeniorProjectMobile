//
//  RV2cells.swift
//  SeniorProject
//
//  Created by Mitchell Petellin on 5/6/19.
//  Copyright © 2019 Mitchell Petellin. All rights reserved.
//

import UIKit

class RV2cells: UITableViewCell {
    
    
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var RaceLabel: UILabel!
    @IBOutlet weak var DateLabel: UILabel!
    @IBOutlet weak var SplitLabel: UILabel!
    @IBOutlet weak var TotalLabel: UILabel!
   
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
