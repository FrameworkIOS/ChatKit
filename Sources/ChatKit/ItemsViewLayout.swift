//
//  ItemsViewLayout.swift
//  ChatKit
//
//  Created by Apple on 13/11/21.
//

import UIKit

public protocol ItemsViewLayoutDelegate: AnyObject {
    var layouts: [AnyItemLayout] { get set }
}

open class ItemsViewLayout: UICollectionViewLayout {
    
    open var inset: UIEdgeInsets = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
    
    open override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return false
    }
    
    open guard func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayout {
        guard indexPath.item < layoutAttributes.count else {
            return nil
        }
        
        return layoutAttributes[indexPath.item]
    }

}
