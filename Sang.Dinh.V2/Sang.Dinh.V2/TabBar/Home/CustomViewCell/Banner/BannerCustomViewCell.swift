//
//  BannerCustomViewCell.swift
//  Sang.Dinh.V2
//
//  Created by Rin Sang on 15/04/2022.
//

import UIKit

class BannerCustomViewCell: UICollectionViewCell {

    @IBOutlet weak var bannerImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func bannerIMG (img: UIImage) {
        bannerImg.image = img
    }
}
