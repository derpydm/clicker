//
//  ResultTableViewCell.swift
//  Clicker
//
//  Created by Sean on 14/7/18.
//  Copyright © 2018 Sean. All rights reserved.
//

import UIKit

class ResultTableViewCell: UITableViewCell {

    @IBOutlet weak var modeLabel: UILabel!
    @IBOutlet weak var cpsLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
