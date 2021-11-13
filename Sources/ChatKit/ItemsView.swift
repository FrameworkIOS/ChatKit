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
    
    open var isInverted: Bool = false {
        didSet {
            if isInverted {
                transform = CGAffineTransform(a: 1, b: 0, c: 0, d: -1, tx: 0, ty: 0)
            } else {
                transform = .identity
            }
        }
    }
}
