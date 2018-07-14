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
    func getBetList()
    func getBetCount() -> Int
    func getBetUser(forIndex index: Int) -> String
    func getBetAmount(forIndex index: Int) -> Double
    func getFlag(forIndex index: Int) -> String
}

class BetListViewPresenter {
    
    weak var view: BetListViewProtocol?
    var router: BetListViewRouterProcotol
    
    var service: FirebaseApiProtocol = FirebaseApiImpl.sharedInstance
    
    var betList = [Bet]()
    
    init(withView view: BetListViewProtocol, andRouter router: BetListViewRouterProcotol) {
        self.view = view
        self.router = router
    }
    
}

// MARK:- Presenter methods
extension BetListViewPresenter: BetListViewPresenterProtocol {
    
    func placeBet() {
        let data = PlaceBetViewData(title: "")
        router.routeToPlaceBetView(withData: data)
    }
    
    func getBetCount() -> Int {
        return betList.count
    }
    
    func getBetUser(forIndex index: Int) -> String {
        return betList[index].name
    }
    
    func getBetAmount(forIndex index: Int) -> Double {
        return betList[index].amount
    }
    
    func getFlag(forIndex index: Int) -> String {
        return betList[index].flag
    }
}

// MARK:- Service Call
extension BetListViewPresenter {
    
    func getBetList() {
        service.getBetsForMatch { (betList) in
            self.betList = betList
            self.view?.updateView()
        }
    }
    
}
