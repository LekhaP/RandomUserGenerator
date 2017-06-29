//
//  RandomUserListingCell.swift
//  RandomUsers
//
//  Created by Preeti Lekha on 6/27/17.
//  Copyright © 2017 randomuser. All rights reserved.
//

import Foundation
import UIKit

class RandomUserListingCell: UITableViewCell {
    
    @IBOutlet var userThumbnailImage: UIImageView!
    @IBOutlet var userName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.userThumbnailImage.layer.cornerRadius = self.userThumbnailImage.frame.size.height * 0.2
        self.userThumbnailImage.clipsToBounds = true
        self.userThumbnailImage.layer.borderWidth = 3.0
        self.userThumbnailImage.layer.borderColor  = (UIColor.init(white: 1, alpha: 0.5)).cgColor
    }    
}
