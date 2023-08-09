//
//  textTableViewCell.swift
//  FunTouch
//
//  Created by Дмитрий on 14.03.2023.
//

import UIKit

class TextTableViewCell: UITableViewCell {

    @IBOutlet var bottomViewHV: UIView!

    @IBOutlet var dataViewLabel: UILabel!

    @IBOutlet var massegeLabel: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func goToMainMenu(_ sender: UIButton) {

    }

}
