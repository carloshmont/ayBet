//
//  CustomNavigationController.swift
//  ayBetMVP
//
//  Created by Carlos H. Montenegro on 13/07/18.
//  Copyright © 2018 everis. All rights reserved.
//

import UIKit

class CustomNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
}

extension CustomNavigationController {
    
    private func initialSetup() {
        navigationBar.barTintColor = UIColor.black
        navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.orange]
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
}
