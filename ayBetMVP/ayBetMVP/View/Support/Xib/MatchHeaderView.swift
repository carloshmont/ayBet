//
//  MatchHeaderView.swift
//  ayBetMVP
//
//  Created by Carlos H. Montenegro on 13/07/18.
//  Copyright © 2018 everis. All rights reserved.
//

import UIKit

class MatchHeaderView: UIView {

    var title: String? {
        didSet {
            matchTitleLabel.text = title
        }
    }
    
    var ratio: String? {
        didSet {
            betRatioLabel.text = ratio
        }
    }
    
    @IBOutlet fileprivate weak var matchTitleLabel: UILabel!
    
    @IBOutlet fileprivate weak var betRatioLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
