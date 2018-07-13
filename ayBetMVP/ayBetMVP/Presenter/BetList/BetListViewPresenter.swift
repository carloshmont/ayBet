//
//  BetListViewPresenter.swift
//  ayBetMVP
//
//  Created by Carlos H. Montenegro on 13/07/18.
//  Copyright © 2018 everis. All rights reserved.
//

import Foundation

protocol BetListViewPresenterProtocol {
    func placeBet()
}

class BetListViewPresenter {
    
    weak var view: BetListViewProtocol?
    var router: BetListViewRouterProcotol
    
    init(withView view: BetListViewProtocol, andRouter router: BetListViewRouterProcotol) {
        self.view = view
        self.router = router
    }
    
}

extension BetListViewPresenter: BetListViewPresenterProtocol {
    
    func placeBet() {
        let data = PlaceBetViewData(title: "")
        router.routeToPlaceBetView(withData: data)
    }
    
}
