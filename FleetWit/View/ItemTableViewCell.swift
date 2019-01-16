//
//  ItemTableViewCell.swift
//  FleetWit
//
//  Created by Ethan Keiser on 1/15/19.
//  Copyright © 2019 Ethan Keiser. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var leftImageView: CustomImageView!
    @IBOutlet weak var commentsLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.commentsLabel.adjustsFontSizeToFitWidth = true;
        self.timeLabel.adjustsFontSizeToFitWidth = true;
        self.authorLabel.adjustsFontSizeToFitWidth = true;
        self.titleLabel.adjustsFontSizeToFitWidth = true;
        self.titleLabel.minimumScaleFactor = 10/UIFont.labelFontSize
    
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
