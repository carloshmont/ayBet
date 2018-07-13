//
//  ModalPresentationController.swift
//  Customer
//
//  Created by Carlos H. Montenegro on 15/05/18.
//  Copyright © 2018 everis. All rights reserved.
//

import UIKit

class ModalPresentationController: UIPresentationController {

    var contentHeight: CGFloat?
    
    fileprivate var dimmingView : UIView!
    
    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
        dimmingViewSetup()
    }
    
    override func presentationTransitionWillBegin() {
        guard let container = containerView else { return }
        
        container.insertSubview(dimmingView, at: 0)
        
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|[dimmingView]|", options: [], metrics: nil, views: ["dimmingView": dimmingView]))
        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|[dimmingView]|",options: [], metrics: nil, views: ["dimmingView": dimmingView]))
        
        guard let coordinator = presentedViewController.transitionCoordinator else {
            dimmingView.alpha = 1.0
            return
        }
        
        coordinator.animate(alongsideTransition: { _ in
            self.dimmingView.alpha = 1.0
        })
    }
    
    override func dismissalTransitionWillBegin() {
        guard let coordinator = presentedViewController.transitionCoordinator else {
            dimmingView.alpha = 0
            return
        }
        
        coordinator.animate(alongsideTransition: { _ in
            self.dimmingView.alpha = 0
        })
    }
    
}

extension ModalPresentationController {
    
    override func containerViewWillLayoutSubviews() {
        presentedView?.frame = frameOfPresentedViewInContainerView
    }
    
    override func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        guard let thisHeight = contentHeight else { return CGSize.zero }
        
        let ratio : CGFloat = 7.0/8.0
        
        return CGSize(width: parentSize.width * ratio, height: thisHeight)
    }
    
    override var frameOfPresentedViewInContainerView: CGRect {
        guard let container = containerView else { return CGRect.zero }
        var frame = CGRect.zero
        
        presentedViewController.view.layer.cornerRadius = 12.0
        presentedViewController.view.layer.masksToBounds = true
        
        frame.size = size(forChildContentContainer: presentedViewController, withParentContainerSize: container.bounds.size)
        
        frame.origin.x = (container.frame.width - frame.size.width) / 2.0
        frame.origin.y = (container.frame.height - frame.size.height) / 2.0
        
        return frame
    }
    
    fileprivate func dimmingViewSetup() {
        dimmingView = UIView()
        dimmingView.translatesAutoresizingMaskIntoConstraints = false
        dimmingView.backgroundColor = UIColor(white: 0.0, alpha: 0.600000023841858)
        dimmingView.alpha = 0.0
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(ModalPresentationController.handleTap(recoginzer:)))
        dimmingView.addGestureRecognizer(recognizer)
    }
    
    @objc dynamic func handleTap(recoginzer: UITapGestureRecognizer) {
        presentingViewController.dismiss(animated: true, completion: nil)
    }
    
}
