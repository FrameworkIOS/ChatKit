//
//  ItemCell.swift
//  ChatKit
//
//  Created by Krisna Pranav on 13/11/21.
//

import UIKit

public protocol ItemCellDelegate: AnyObject { }

open class ItemCell: UICollectionViewCell {
    open class var reuseIdentifier: String { NSStringFromClass(Self.self) }
    
    open weak var delegate: ItemCellDelegate?

    open var layout: AnyItemLayout? {
        didSet {
            if let size = layout?.size, size != itemView.frame.size {
                itemView.frame = CGRect(origin: .zero, size: size)
            }
        }
    }
    
    public let itemView = UIView()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    public func commonInit() {
        itemView.frame = contentView.bounds
        contentView.addSubview(itemView)
    }

    
}
