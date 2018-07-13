//
//  ModalPresentationTransitioningDelegate.swift
//  Customer
//
//  Created by Carlos H. Montenegro on 15/05/18.
//  Copyright © 2018 everis. All rights reserved.
//

import UIKit

class ModalPresentationTransitioningDelegate: NSObject, UIViewControllerTransitioningDelegate {

    var contentHeight: CGFloat = 352
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        
        let presentationController = ModalPresentationController(presentedViewController: presented, presenting: presenting)
        presentationController.contentHeight = contentHeight
        return presentationController
    }
    
}
