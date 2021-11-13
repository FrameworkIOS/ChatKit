//
//  ContainerView.swift
//  ChatKit
//
//  Created by Krisna Pranav on 13/11/21.
//

import UIKit

open class ContainerView: UIView {
    
    open var sizeHandler: ((CGSize) -> Void)?
    
    private var validSize: CGSize = .zero
    
    open override var frame: CGRect {
        didSet {
            validSize = frame.size
            sizeHandler?(frame.size)
        }
    }
    
    open override var bounds: CGRect {
        didSet {
            validSize = bounds.size
            sizeHandler?(bounds.size)
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        validSize = frame.size
    }
    
}
