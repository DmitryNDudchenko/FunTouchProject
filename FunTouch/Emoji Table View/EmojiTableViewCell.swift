//
//  EmojiTableViewCell.swift
//  FunTouch
//
//  Created by Дмитрий on 25.12.2022.
//

import UIKit

class EmojiTableViewCell: UITableViewCell {


    @IBOutlet weak var symbolLabel: UILabel!

    @IBOutlet weak var nameLabel: UILabel!

    @IBOutlet weak var descriptionLable: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()


    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }


    func update(with emoji:Emojis){

        symbolLabel.text = emoji.symbol
        nameLabel.text = emoji.name
        descriptionLable.text = emoji.description
    }

}
