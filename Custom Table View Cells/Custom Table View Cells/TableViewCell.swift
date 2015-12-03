//
//  TableViewCell.swift
//  Custom Table View Cells
//
//  Created by Siddhant Pagariya on 8/1/15.
//  Copyright © 2015 Siddhant Pagariya. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        textField.text = "Initialized!"
        label.text = "Initialized"
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        self.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0)
    }

}
