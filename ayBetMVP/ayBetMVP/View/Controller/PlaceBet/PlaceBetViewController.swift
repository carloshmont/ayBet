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
        presenter.placeBet(withAmmount: amount)
    }
    
    @IBAction func didSelectOption(_ sender: UISegmentedControl) {
        presenter.didSelectTeam(withIndex: sender.selectedSegmentIndex)
    }
    
    @IBAction func didTapOutsideKeyboard(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    
}

extension PlaceBetViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.3, animations: {
            self.view.frame = CGRect(x:self.view.frame.origin.x, y:self.view.frame.origin.y - 100, width:self.view.frame.size.width, height:self.view.frame.size.height);
            
        })
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.3, animations: {
            self.view.frame = CGRect(x: self.view.frame.origin.x, y: self.view.frame.origin.y + 100, width: self.view.frame.size.width, height: self.view.frame.size.height);
            
        })
    }
    
}

// MARK:- View protocol methods
extension PlaceBetViewController: PlaceBetViewProtocol {
    
}

// MARK:- View setup methods
extension PlaceBetViewController {
    
    private func initialSetup() {
        amountTextField.delegate = self
    }
    
    private func configureView() {
        let router = PlaceBetViewRouter(withView: self)
        presenter = PlaceBetViewPresenter(withView: self, andRouter: router)
    }
    
}
