//
//  PlaceBetViewRouter.swift
//  ayBetMVP
//
//  Created by Carlos H. Montenegro on 13/07/18.
//  Copyright © 2018 everis. All rights reserved.
//

import Foundation

protocol PlaceBetViewRouterProcotol {
    var currentView: PlaceBetViewController? { get set }
    
}

class PlaceBetViewRouter: PlaceBetViewRouterProcotol {
    
    weak var currentView: PlaceBetViewController?
    
    init(withView view: PlaceBetViewController) {
        self.currentView = view
    }
}
