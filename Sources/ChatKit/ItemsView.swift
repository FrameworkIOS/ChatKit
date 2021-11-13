//
//  ItemsView.swift
//  ChatKit
//
//  Created by Apple on 13/11/21.
//

import UIKit

open class ItemView: UICollectionView {
    open var contentInsetChangeAction: (() -> Void)?
    
    open override var contentInset: UIEdgeInsets {
        didSet {
            scrollIndicatorInsets = contentInset
            contentInsetChangeAction?()
        }
    }
    
    open var tapAction: (() -> Void)?
    
    open var tapGestureRecgonizer: UITapGestureRecognizer?
}
