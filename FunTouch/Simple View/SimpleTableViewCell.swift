//
//  SimpleTableViewCell.swift
//  FunTouch
//
//  Created by Дмитрий on 23.12.2022.
//

import UIKit

class SimpleTableViewCell: UITableViewCell {

    @IBOutlet weak var lableCell: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
