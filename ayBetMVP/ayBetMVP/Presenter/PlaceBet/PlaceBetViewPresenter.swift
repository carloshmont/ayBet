//
//  PlaceBetViewPresenter.swift
//  ayBetMVP
//
//  Created by Carlos H. Montenegro on 13/07/18.
//  Copyright © 2018 everis. All rights reserved.
//

import Foundation

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

protocol PlaceBetViewPresenterProtocol {
    func didSelectTeam(withIndex index: Int)
    func placeBet(withAmmount amount: String)
}

class PlaceBetViewPresenter {
    
    weak var view: PlaceBetViewProtocol?
    var router: PlaceBetViewRouterProcotol
    var service: FirebaseApiProtocol = FirebaseApiImpl.sharedInstance
    
    private var selectedTeam: Team = .belgium
    private var selectedFlag: Flag = .belgium
    
    init(withView view: PlaceBetViewProtocol, andRouter router: PlaceBetViewRouterProcotol) {
        self.view = view
        self.router = router
    }
    
}

extension PlaceBetViewPresenter: PlaceBetViewPresenterProtocol {
    
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
    
    func placeBet(withAmmount amount: String) {
        guard let amountDouble = Double(amount) else { return }
        service.setBet(amount: amountDouble, idTeam: selectedTeam.rawValue, user: "Karl", flag: selectedFlag.rawValue) { (status, error) in
            if let success = status {
                if success {
                    self.router.routeToRoot()
                }
            }
        }
    }
    
}
