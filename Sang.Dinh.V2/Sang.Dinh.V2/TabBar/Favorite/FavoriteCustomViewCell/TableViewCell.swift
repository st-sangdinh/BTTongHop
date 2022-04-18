//
//  TableViewCell.swift
//  Sang.Dinh.V2
//
//  Created by Rin Sang on 18/04/2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var favoriteImg: UIImageView!
    @IBOutlet weak var favoriteLabel: UILabel!
    @IBOutlet weak var favoritePrice: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setDataFavorite (img:UIImage, name: String, price: Int) {
        favoriteImg.image = img
        favoriteLabel.text = name
        favoritePrice.text = "\(price)"
    }
    
}
