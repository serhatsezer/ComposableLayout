//
//  OnboardViewController.swift
//  ComplexLayout
//
//  Created by Serhat Sezer on 25.4.2020.
//  Copyright © 2020 Serhat Sezer. All rights reserved.
//

import UIKit

class OnboardViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        print(view.frame)
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 30))
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "This is some other content"
        view.addSubview(label)
        view.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(goTo))
        view.addGestureRecognizer(tap)
    }
    
    @objc func goTo(r: UITapGestureRecognizer) {
        print("goto")
        navigationController?.pushViewController(NewItemViewController(), animated: true)
//        present(NewItemViewController(), animated: true, completion: nil)
    }
}

class NewItemViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
    }
}


extension OnboardViewController: HeightIdentifiableViewController {
    var contentHeight: Int {
        return 100
    }
}
