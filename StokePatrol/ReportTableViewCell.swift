//
//  ReportTableViewCell.swift
//  StokePatrol
//
//  Created by Rachel Stevenson on 6/10/15.
//  Copyright (c) 2015 rachelrockaway. All rights reserved.
//

import Parse
import UIKit

class ReportTableViewCell: UITableViewCell {

    
    //Data Variables
    
    //Outlets
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var timestampLabel: UILabel!
    
    
    @IBOutlet weak var reportTextView: UITextView!
    
    
    @IBOutlet weak var waveHeightLabel: UILabel!
    
    
    @IBOutlet weak var windSpeedLabel: UILabel!
    
    @IBOutlet weak var windDirectionLabel: UILabel!
    
    
    @IBOutlet weak var tideDirectionLabel: UILabel!
    
    
    
    //Actions
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
