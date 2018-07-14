//
//  PlaceBetViewController.swift
//  ayBetMVP
//
//  Created by Carlos H. Montenegro on 13/07/18.
//  Copyright © 2018 everis. All rights reserved.
//

import UIKit


enum Flag: String {
    case belgium = "🇧🇪"
    case england = "🏴󠁧󠁢󠁥󠁮󠁧󠁿"
}

enum Team: String {
    case belgium = "BEL"
    case england = "ENG"
}

enum TeamIndex: Int {
    case belgium
    case england
}

class PlaceBetViewController: UIViewController {

    @IBOutlet fileprivate weak var amountTextField: UITextField!
    @IBOutlet fileprivate weak var teamSegmentedControl: UISegmentedControl!
    @IBOutlet fileprivate weak var placeBetButton: UIButton!
    
    var service: FirebaseApiProtocol = FirebaseApiImpl.sharedInstance
    
    private var selectedTeam: Team = .belgium
    private var selectedFlag: Flag = .belgium

    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }

    @IBAction func didTapPlaceBetButton(_ sender: UIButton) {
        guard let amount = amountTextField.text else { return }
        placeBet(withAmmount: amount)
    }
    
    @IBAction func didSelectOption(_ sender: UISegmentedControl) {
       didSelectTeam(withIndex: sender.selectedSegmentIndex)
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


// MARK:- View setup methods
extension PlaceBetViewController {
    
    private func initialSetup() {
        amountTextField.delegate = self
    }
    
}

// MARK:- View call firebase
extension PlaceBetViewController {

    func placeBet(withAmmount amount: String) {
        guard let amountDouble = Double(amount) else { return }
        service.setBet(amount: amountDouble, idTeam: selectedTeam.rawValue, user: "Karl", flag: selectedFlag.rawValue) { (status, error) in
            if let success = status {
                if success {
                    self.dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
    func didSelectTeam(withIndex index: Int) {
        guard let selectedIndex = TeamIndex(rawValue: index) else { return }
        switch selectedIndex {
        case .belgium:
            selectedTeam = .belgium
            selectedFlag = .belgium
        case .england:
            selectedTeam = .england
            selectedFlag = .england
        }
    }
    
}
