//
//  BetListViewController.swift
//  ayBetMVP
//
//  Created by Carlos H. Montenegro on 13/07/18.
//  Copyright © 2018 everis. All rights reserved.
//

import UIKit

class BetListViewController: UIViewController {

    @IBOutlet fileprivate weak var betListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }

}

//extension BetListViewController: UITableViewDelegate {
//    
//}
//
//extension BetListViewController: UITableViewDataSource {
//    
//}

extension BetListViewController {
    
    fileprivate func initialSetup() {
        title = "ayBet"
//        betListTableView.dataSource = self
//        betListTableView.delegate = self
    }
    
}
