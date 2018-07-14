//
//  BetTableViewCell.swift
//  ayBetMVP
//
//  Created by Carlos H. Montenegro on 13/07/18.
//  Copyright © 2018 everis. All rights reserved.
//

import UIKit

class BetTableViewCell: UITableViewCell {

    var user: String? {
        didSet {
            userNameLabel.text = user
        }
    }
    
    var amount: String? {
        didSet {
            amountLabel.text = amount
        }
    }
    
    var flag: String? {
        didSet {
            flagLabel.text = flag
        }
    }
    
    @IBOutlet fileprivate weak var userNameLabel: UILabel!
    @IBOutlet fileprivate weak var amountLabel: UILabel!
    @IBOutlet fileprivate weak var flagLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
