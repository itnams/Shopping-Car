//
//  managerofAdminTableViewCell.swift
//  ShopCar
//
//  Created by Nam Nguyen on 8/7/20.
//  Copyright © 2020 Nam Nguyen. All rights reserved.
//

import UIKit

class managerofAdminTableViewCell: UITableViewCell {
    @IBOutlet weak var imgManager: UIImageView!
    
    @IBOutlet weak var lblTenSP: UILabel!
    
    @IBOutlet weak var lblGia: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
