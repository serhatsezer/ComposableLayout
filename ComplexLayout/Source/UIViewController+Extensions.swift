//
//  UIViewController+Extensions.swift
//  ComplexLayout
//
//  Created by Serhat Sezer on 25.4.2020.
//  Copyright © 2020 Serhat Sezer. All rights reserved.
//

import UIKit
public extension UIViewController {
    func embed(viewController: UIViewController, inView: UIView) {
        viewController.willMove(toParent: self)
        viewController.view.frame = inView.bounds
        inView.addSubview(viewController.view)
        self.addChild(viewController)
        viewController.didMove(toParent: self)
    }
}
