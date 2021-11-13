//
//  ItemsView.swift
//  ChatKit
//
//  Created by Apple on 13/11/21.
//

import UIKit
import AppKit

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
    
    public override init(frame: CGRect, NSCollectionViewLayout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        commonInit()
    }
    
    public required init?(code: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    public func commonInit() {
        backgroundColor = UIColor.clear
        showsVerticalScrollIndicator = true
        showsHorizontalScrollIndicator = false
        scrollsToTop = false
        alwaysBounceVertical = true
        contentInsetAdjustmentBehavior = .never
        setupTapGestureRecgonizer()
    }
    
    private func setupTapGestureRecognizer() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onTapped))
        tapGestureRecognizer.cancelsTouchesInView = false
        addGestureRecognizer(tapGestureRecognizer)
        self.tapGestureRecognizer = tapGestureRecognizer
    }
    
    @objc private func onTapped() {
        tapAction?()
    }
}
