//
//  ItemTableViewCell.swift
//  FleetWit
//
//  Created by Ethan Keiser on 1/15/19.
//  Copyright © 2019 Ethan Keiser. All rights reserved.
//

import UIKit
import SVProgressHUD
protocol ItemTableViewCellProtocol
{
    func didSelect(item: Item)
}
class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var leftImageView: CustomImageView!
    @IBOutlet weak var commentsLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    var item : Item?
    var delegate : ItemTableViewCellProtocol?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.commentsLabel.adjustsFontSizeToFitWidth = true;
        self.timeLabel.adjustsFontSizeToFitWidth = true;
        self.authorLabel.adjustsFontSizeToFitWidth = true;
        self.titleLabel.adjustsFontSizeToFitWidth = true;
        self.titleLabel.minimumScaleFactor = 10/UIFont.labelFontSize
        self.selectionStyle = .none
    
    }
    func configure(model :Item)
    {
        self.item = model
        self.titleLabel.text = model.title
        self.authorLabel.text = model.author
        self.commentsLabel.text = "\(model.num_comments ) comments"
        
        self.leftImageView.loadImageUsingUrlString(urlString: model.thumbnail)
        self.leftImageView.isUserInteractionEnabled = true
        self.leftImageView?.addGestureRecognizer(UITapGestureRecognizer(target: self, action:#selector(touched)))

        let created = Date(timeIntervalSince1970: model.created_utc)
        let difference = Date().hours(from: created)
        self.timeLabel.text = "\(difference) hours ago"
    }
    @objc func touched()
    {
        guard let delegate = delegate else {fatalError("Delegate not set")}
        guard let item = self.item else {
            SVProgressHUD.showError(withStatus: "Image does not exist")
            return
        }

        delegate.didSelect(item: item)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
