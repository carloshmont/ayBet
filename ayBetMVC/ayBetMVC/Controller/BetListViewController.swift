//
//  BetListViewController.swift
//  ayBetMVC
//
//  Created by HAROL GOMEZ RUIZ on 13/7/18.
//  Copyright © 2018 everis. All rights reserved.
//

import UIKit

class BetListViewController: UIViewController {

    var arrayBet = [Bet]()
    @IBOutlet fileprivate weak var betListTableView: UITableView!
    var service: FirebaseApiProtocol = FirebaseApiImpl.sharedInstance
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        getBetList()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapPlaceBet(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "showBet", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }

}

// MARK:- Table view delegate methods
extension BetListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let nib = UINib(nibName: "MatchHeaderView", bundle: nil)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? MatchHeaderView else { return nil }
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
        return arrayBet.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "betCell", for: indexPath) as! BetTableViewCell
        cell.user = arrayBet[indexPath.row].name
        cell.amount = "S/ \(arrayBet[indexPath.row].amount)"
        cell.flag = arrayBet[indexPath.row].flag
        return cell
    }
}

// MARK:- View setup methods
extension BetListViewController {
    
    fileprivate func initialSetup() {
        betListTableView.dataSource = self
        betListTableView.delegate = self
    }
    
    func getBetList(){
        service.getBetsForMatch { (betList) in
            self.arrayBet = betList
            self.betListTableView.reloadData()
        }
    }
    
}

