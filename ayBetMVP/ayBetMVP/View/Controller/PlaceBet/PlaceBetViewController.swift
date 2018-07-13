//
//  PlaceBetViewController.swift
//  ayBetMVP
//
//  Created by Carlos H. Montenegro on 13/07/18.
//  Copyright © 2018 everis. All rights reserved.
//

import UIKit

protocol PlaceBetViewProtocol: class {
    
}

class PlaceBetViewController: UIViewController {

    var presenter: PlaceBetViewPresenterProtocol!
    
    @IBOutlet fileprivate weak var amountTextField: UITextField!
    @IBOutlet fileprivate weak var teamSegmentedControl: UISegmentedControl!
    @IBOutlet fileprivate weak var placeBetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        configureView()
    }

    @IBAction func didTapPlaceBetButton(_ sender: UIButton) {
        guard let amount = amountTextField.text else { return }
        presenter.placeBet(withAmmount: amount, andTeam: "")
    }
    
    @IBAction func didSelectOption(_ sender: UISegmentedControl) {
        
    }
}

// MARK:- View protocol methods
extension PlaceBetViewController: PlaceBetViewProtocol {
    
}

// MARK:- View setup methods
extension PlaceBetViewController {
    
    private func initialSetup() {
        
    }
    
    private func configureView() {
        let router = PlaceBetViewRouter(withView: self)
        presenter = PlaceBetViewPresenter(withView: self, andRouter: router)
    }
    
}
