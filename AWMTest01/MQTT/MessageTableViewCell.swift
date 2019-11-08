//
//  MessageTableViewCell.swift
//  AWMTest01
//
//  Created by AWM Solutions on 10/23/19.
//  Copyright © 2019 AWM Solutions. All rights reserved.
//
import UIKit

class MessageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var topicLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
