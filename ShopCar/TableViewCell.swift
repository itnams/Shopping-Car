//
//  TableViewCell.swift
//  ShopCar
//
//  Created by Nam Nguyen on 7/29/20.
//  Copyright © 2020 Nam Nguyen. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var lblTenSP: UILabel!
    
    
    @IBOutlet weak var lblGiaSP: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
