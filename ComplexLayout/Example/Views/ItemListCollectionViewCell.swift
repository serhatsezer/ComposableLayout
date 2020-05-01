//
//  ItemListCollectionViewCell.swift
//  ComplexLayout
//
//  Created by Serhat Sezer on 25.4.2020.
//  Copyright © 2020 Serhat Sezer. All rights reserved.
//

import UIKit

class ItemListCollectionViewCell: UICollectionViewCell {
    private lazy var label = UILabel(frame: CGRect(x: 0, y: 0, width: 90, height: 30))

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func commonInit() {
        label.textColor = .white
        label.textAlignment = .center
        addSubview(label)
    }
    
    var title: String = "" {
        didSet {
            label.text = title
        }
    }
}
