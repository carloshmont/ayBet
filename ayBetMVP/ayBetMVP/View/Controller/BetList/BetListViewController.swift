//
//  BetListViewController.swift
//  ayBetMVP
//
//  Created by Carlos H. Montenegro on 13/07/18.
//  Copyright © 2018 everis. All rights reserved.
//

import UIKit

@objc protocol ViewProtocol {
    @objc optional func startLoading()
    @objc optional func finishedLoading()
}

protocol BetListViewProtocol: class, ViewProtocol {
    func setViewHeader(withMatch match: String, andRatio ratio: String)
    func updateView()
}

class BetListViewController: UIViewController {

    var presenter: BetListViewPresenterProtocol!
    
    @IBOutlet fileprivate weak var betListTableView: UITableView!
    
    var matchTitle: String!
    var matchRatio: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        configureView()
        presenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    @IBAction func didTapPlaceBet(_ sender: UIBarButtonItem) {
        presenter.placeBet()
    }
}

// MARK:- View protocol methods
extension BetListViewController: BetListViewProtocol {
    
    func updateView() {
        betListTableView.reloadData()
    }
    
    func setViewHeader(withMatch match: String, andRatio ratio: String) {
        self.matchTitle = match
        self.matchRatio = ratio
    }
}

// MARK:- Table view delegate methods
extension BetListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let nib = UINib(nibName: "MatchHeaderView", bundle: nil)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? MatchHeaderView else { return nil }
        view.title = self.matchTitle
        view.ratio = self.matchRatio
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 90
    }
}

// MARK:- Table view data source methods
extension BetListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getBetCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "betCell", for: indexPath) as! BetTableViewCell
        cell.user = presenter.getBetUser(forIndex: indexPath.row)
        cell.amount = "S/ \(presenter.getBetAmount(forIndex: indexPath.row))"
        cell.flag = presenter.getFlag(forIndex: indexPath.row)
        return cell
    }
    
}

// MARK:- View setup methods
extension BetListViewController {
    
    fileprivate func initialSetup() {
        betListTableView.dataSource = self
        betListTableView.delegate = self
    }
    
    fileprivate func configureView() {
        let router = BetListViewRouter(withView: self)
        presenter = BetListViewPresenter(withView: self, andRouter: router)
    }
    
}
