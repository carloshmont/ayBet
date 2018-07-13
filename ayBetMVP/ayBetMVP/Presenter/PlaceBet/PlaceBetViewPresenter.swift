//
//  PlaceBetViewPresenter.swift
//  ayBetMVP
//
//  Created by Carlos H. Montenegro on 13/07/18.
//  Copyright © 2018 everis. All rights reserved.
//

import Foundation

protocol PlaceBetViewPresenterProtocol {
    func placeBet(withAmmount amount: String, andTeam team: String)
}

class PlaceBetViewPresenter {
    
    weak var view: PlaceBetViewProtocol?
    var router: PlaceBetViewRouterProcotol
    
    init(withView view: PlaceBetViewProtocol, andRouter router: PlaceBetViewRouterProcotol) {
        self.view = view
        self.router = router
    }
    
}

extension PlaceBetViewPresenter: PlaceBetViewPresenterProtocol {
    
    func placeBet(withAmmount amount: String, andTeam team: String) {
        
    }
    
}
