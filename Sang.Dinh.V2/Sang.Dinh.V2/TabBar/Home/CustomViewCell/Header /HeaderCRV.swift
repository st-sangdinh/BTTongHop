//
//  HeaderCRV.swift
//  Sang.Dinh.V2
//
//  Created by Rin Sang on 15/04/2022.
//

import UIKit

class HeaderCRV: UICollectionReusableView {

    @IBOutlet weak var view: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        layer.cornerRadius = 10
        
        view.layer.cornerRadius = 10
    }
    
}
