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
    func routeToRoot()
}

class PlaceBetViewRouter: PlaceBetViewRouterProcotol {
    
    weak var currentView: PlaceBetViewController?
    
    init(withView view: PlaceBetViewController) {
        self.currentView = view
    }
    
    func routeToRoot() {
        guard let view = currentView else { return }
        view.dismiss(animated: true, completion: nil)
    }
}
