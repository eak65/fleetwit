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
    func configure(model :Item)
    {
        self.titleLabel.text = model.title
        self.authorLabel.text = model.author
        self.commentsLabel.text = "\(model.num_comments ?? 0) comments"
        self.leftImageView.loadImageUsingUrlString(urlString: model.thumbnail!)
        
        let created = Date(timeIntervalSince1970: model.created!)
        let difference = Date().hours(from: created)
        self.timeLabel.text = "\(difference) hours ago"
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
