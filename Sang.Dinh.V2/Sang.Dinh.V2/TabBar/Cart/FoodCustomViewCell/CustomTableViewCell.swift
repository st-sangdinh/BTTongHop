//
//  CustomTableViewCell.swift
//  Sang.Dinh.V2
//
//  Created by Rin Sang on 16/04/2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var foodImg: UIImageView!
    @IBOutlet weak var foodNameCell: UILabel!
    @IBOutlet weak var foodPrice: UILabel!
    @IBOutlet weak var foodQuantity: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutIfNeeded()
        foodImg.layer.cornerRadius = 10
    }
    
    func setDataCart(img: UIImage, name: String, price: Int, quantity: Int){
        foodImg.image = img
        foodNameCell.text = name
        foodPrice.text = "\(price)"
        foodQuantity.text = "X\(quantity)"
    }

}
