//
//  AnalysTableViewCell.swift
//  SilverArrow
//
//  Created by Apit on 2/13/18.
//  Copyright © 2018 Apit. All rights reserved.
//

import UIKit
import TTTAttributedLabel

class AnalysTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var postDateLabel: UILabel!
    @IBOutlet weak var contentLabel: TTTAttributedLabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
