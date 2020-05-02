//
//  ComposableLayoutView.swift
//  ComplexLayout
//
//  Created by Serhat Sezer on 1.5.2020.
//  Copyright © 2020 Serhat Sezer. All rights reserved.
//

import UIKit

class ComposableLayoutView: UIView {
    
    // MARK: Private members
    private var scrollView: UIScrollView = {
        let sv = UIScrollView(frame: .zero)
        sv.showsHorizontalScrollIndicator = false
        return sv
    }()
    
    private var embedViewController: UIViewController!
    
    private var viewControllers: [UIViewController]? {
        didSet {
            guard let contentViewControllers = viewControllers else { return }
            setupViews(with: contentViewControllers)
        }
    }
    
    
    func embed(in viewController: UIViewController, viewControllers: [UIViewController]) {
        embedViewController = viewController
        embedViewController.view.addSubview(self)
        self.viewControllers = viewControllers
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setupViews(with viewControllers: [UIViewController]) {
        let itemHolderView = UIView(frame: .zero)
        itemHolderView.accessibilityIdentifier = "holder view"
        itemHolderView.frame = bounds
        scrollView.addSubview(itemHolderView)
        
        let items: [ScrollableView] = viewControllers.map { vc in
            let holderView = ScrollableView(frame: .zero)
            itemHolderView.addSubview(holderView)
            holderView.translatesAutoresizingMaskIntoConstraints = false
            embedViewController.embed(viewController: vc, inView: holderView)
            return holderView
        }
        items.forEach(scrollView.addSubview)
        
        // layouting
        var totalContentHeight = 0
        items.enumerated().forEach { item in
            let containerVC = viewControllers[item.offset] as! HeightIdentifiableViewController
            if item.offset == 0 {
                item.element.topAnchor.constraint(equalTo: itemHolderView.topAnchor, constant: 10).isActive = true
            } else {
                let prevView = items[item.offset - 1]
                item.element.topAnchor.constraint(equalTo: prevView.bottomAnchor, constant: 10).isActive = true
            }
            item.element.leadingAnchor.constraint(equalTo: itemHolderView.leadingAnchor).isActive = true
            item.element.trailingAnchor.constraint(equalTo: itemHolderView.trailingAnchor).isActive = true
            item.element.heightAnchor.constraint(equalToConstant: CGFloat(containerVC.contentHeight)).isActive = true
            item.element.widthAnchor.constraint(equalTo: itemHolderView.widthAnchor).isActive = true
            totalContentHeight += containerVC.contentHeight
        }
        
        scrollView.contentSize = CGSize(width: Int(bounds.width),
                                        height: totalContentHeight + topbarHeight + 20) // 20 top and bottom constant
    }
    
    
    var topbarHeight: Int {
        guard let navController = embedViewController.navigationController else { return 64 }
        let barHeight = navController.navigationBar.frame.height
        let statusFrameHeight = UIApplication.shared.statusBarFrame.size.height
        return Int(barHeight) + Int(statusFrameHeight)
    }
}

protocol HeightIdentifiableViewController {
    var contentHeight: Int { get }
}
