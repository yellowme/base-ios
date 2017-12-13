//
//  UICollectionView+Ext.swift
//  YellowPod
//
//  Created by Erick A. Montañez  on 11/29/17.
//  Copyright © 2017 YellowPod. All rights reserved.
//

import UIKit

enum CollectionViewCellIdentifier: String {
    case SearchResult = "SearchResultCollectionViewCell"
    case SimpleCollectionViewCell = "SimpleCollectionViewCell"
}

extension UICollectionView {
    func dequeue<T: UICollectionViewCell>(_ cell: CollectionViewCellIdentifier, for indexPath: IndexPath, castingTo: T.Type) -> T {
        return dequeueReusableCell(withReuseIdentifier: cell.rawValue, for: indexPath) as! T
    }
    
    func registerCell(_ cell: CollectionViewCellIdentifier) {
        let collectionViewCellNib = UINib(nibName: cell.rawValue, bundle: nil)
        register(collectionViewCellNib, forCellWithReuseIdentifier: cell.rawValue)
    }
}
