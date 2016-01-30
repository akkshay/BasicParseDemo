//
//  ImageTableViewCell.swift
//  ParseStarterProject-Swift
//
//  Created by Akkshay Khoslaa on 1/13/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell {

    @IBOutlet weak var parseImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
