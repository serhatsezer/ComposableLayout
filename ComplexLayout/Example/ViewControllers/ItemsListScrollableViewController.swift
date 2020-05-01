//
//  ItemsListScrollableViewController.swift
//  ComplexLayout
//
//  Created by Serhat Sezer on 25.4.2020.
//  Copyright © 2020 Serhat Sezer. All rights reserved.
//

import UIKit

class ItemsListScrollableViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sw = view.bounds.width
        let flowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.itemSize = CGSize(width: sw / 3, height: 45)
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 10
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        flowLayout.scrollDirection = .horizontal
        collectionView.backgroundColor = .white
        collectionView.collectionViewLayout = flowLayout
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ItemListCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ItemListCollectionViewCell
        cell.backgroundColor = .orange
        cell.title = "Cell \(indexPath.item)"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("selected item section: \(indexPath.section) , row : \(indexPath.row)")
    }
}

extension ItemsListScrollableViewController: HeightIdentifiableViewController {
    var contentHeight: Int {
        return 150
    }
}
