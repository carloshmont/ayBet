//
//  BetListViewRouter.swift
//  ayBetMVP
//
//  Created by Carlos H. Montenegro on 13/07/18.
//  Copyright © 2018 everis. All rights reserved.
//

import UIKit

protocol BetListViewRouterProcotol {
    var currentView: BetListViewController? { get set }
    func routeToPlaceBetView(withData data: ViewData)
}

class BetListViewRouter: BetListViewRouterProcotol {

    weak var currentView: BetListViewController?
    
    private let transitioningDelegate = ModalPresentationTransitioningDelegate()
    private let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    init(withView view: BetListViewController) {
        self.currentView = view
    }
    
    func routeToPlaceBetView(withData data: ViewData) {
        guard let betView = storyboard.instantiateViewController(withIdentifier: "placeBetView") as? PlaceBetViewController,
            let currentContextView = currentView
        else { return }
        betView.transitioningDelegate = transitioningDelegate
        betView.modalTransitionStyle = .coverVertical
        betView.modalPresentationStyle = .custom
        currentContextView.present(betView, animated: true, completion: nil)
    }
}
