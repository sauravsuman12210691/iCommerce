//
//  ItemCell.swift
//  ecom
//
//  Created by Student on 26/04/25.
//

import UIKit

class ItemCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var itemImageView: UIImageView!
        @IBOutlet weak var itemNameLabel: UILabel!
        @IBOutlet weak var itemPriceLabel: UILabel!

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
