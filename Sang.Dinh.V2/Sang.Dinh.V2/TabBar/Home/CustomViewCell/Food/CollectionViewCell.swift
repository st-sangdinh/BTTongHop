//
//  CollectionViewCell.swift
//  Sang.Dinh.V2
//
//  Created by Rin Sang on 15/04/2022.
//

import UIKit

protocol FoodCollectionViewDelegate: AnyObject{
    func cell(cell: CollectionViewCell,_ action: CollectionViewCell.Action)
}


class CollectionViewCell: UICollectionViewCell {
    
    enum Action {
        case getNumber(number: Int)
        case favorite(isFavorite: Bool)
    }

    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var nameFood: UILabel!
    @IBOutlet weak var priceFood: UILabel!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var addButoon: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var totalLabel: UILabel!
    
    weak var delegate: FoodCollectionViewDelegate?
    
    
    var number: Int = 0
    var price: Int = 0
    var favorite: Bool = false

    override func awakeFromNib() {
        super.awakeFromNib()

//        print(foodImage.frame)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutIfNeeded()
        foodImage.layer.cornerRadius = foodImage.frame.width / 2
        foodImage.clipsToBounds = true
    }
    
    func setData(img: UIImage, name: String, price: Int, number: Int, isFavorite: Bool) {
        foodImage.image  = img
        nameFood.text = name
        priceFood.text = "\(price)"
        totalLabel.text = "\(number)"
        self.number = number
//        self.price = price
        //
        let image = isFavorite ? UIImage(named: "Favorite") : UIImage(named: "Favorite2")
        //
        favoriteButton.setImage(image, for: .normal)
    }

    @IBAction func favoriteButton(_ sender: Any) {
        //
        favorite.toggle()
        //
        let image = favorite ? UIImage(named: "Favorite") : UIImage(named: "Favorite2")
        //
        favoriteButton.setImage(image, for: .normal)
        //
        delegate?.cell(cell: self, .favorite(isFavorite: favorite))
        
    }
    @IBAction func addButton(_ sender: Any) {
        number += 1 
        totalLabel.text = "\(number)"
//        priceFood.text = "\(number * price)"
        delegate?.cell(cell: self, .getNumber(number: number))
    }
    
    @IBAction func minusButton(_ sender: Any) {
        if number  > 0 {
            number -= 1
            totalLabel.text = "\(number)"
            delegate?.cell(cell: self, .getNumber(number: number))
        }
    }
}
    
