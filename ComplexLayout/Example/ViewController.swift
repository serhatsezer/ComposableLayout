//
//  ViewController.swift
//  ComplexLayout
//
//  Created by Serhat Sezer on 25.4.2020.
//  Copyright © 2020 Serhat Sezer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let composableView = ComposableLayoutView(frame: view.bounds)
        composableView.embed(in: self, viewControllers: [ItemsListScrollableViewController(),
                                                         OnboardViewController(),
                                                         ItemsListScrollableViewController(),
                                                         OnboardViewController(),
                                                         ItemsListScrollableViewController(),
                                                         OnboardViewController(),
                                                         ItemsListScrollableViewController()])
    }
}
