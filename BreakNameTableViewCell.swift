//
//  BreakNameTableViewCell.swift
//  StokePatrol
//
//  Created by Rachel Stevenson on 6/10/15.
//  Copyright (c) 2015 rachelrockaway. All rights reserved.
//

import Parse
import UIKit

class BreakNameTableViewCell: UITableViewCell {
    
    
    //Data Variables
    
    //Outlets
    
    @IBOutlet weak var breakDisplayLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
