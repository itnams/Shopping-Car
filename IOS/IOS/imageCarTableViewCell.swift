//
//  imageCarTableViewCell.swift
//  IOS
//
//  Created by Nam Nguyen on 7/23/20.
//  Copyright © 2020 Nam Nguyen. All rights reserved.
//

import UIKit

class imageCarTableViewCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var tblTitle: UILabel!
    
    
    @IBOutlet weak var lblDetail: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
