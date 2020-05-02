//
//  OnboardViewController.swift
//  ComplexLayout
//
//  Created by Serhat Sezer on 25.4.2020.
//  Copyright © 2020 Serhat Sezer. All rights reserved.
//

import UIKit

class OnboardViewController: UIViewController {
    
    private lazy var stackView: UIStackView = {
        let sv = UIStackView(frame: .zero)
        sv.alignment = .fill
        sv.distribution = .fillEqually
        sv.axis = .vertical
        sv.spacing = 3
        return sv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        print(view.frame)
        let label = UILabel(frame: CGRect(x: 10, y: 0, width: view.bounds.width, height: 30))
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.text = "Another content"
        view.addSubview(label)
        view.isUserInteractionEnabled = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(goTo))
        view.addGestureRecognizer(tap)

        stackView.frame = CGRect(x: 10, y: label.frame.maxY, width: view.frame.width - 20, height: CGFloat(contentHeight) - label.frame.height)
        view.addSubview(stackView)
        
        let colors: [UIColor] = [.red, .orange, .cyan, .blue]
        let views: [UIView] = colors.map { color in
            let view = UIView(frame: .zero)
            view.backgroundColor = color
            return view
        }
        views.forEach(stackView.addArrangedSubview)
        
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
        return 150
    }
}
