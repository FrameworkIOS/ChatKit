//
//  ItemCell.swift
//  ChatKit
//
//  Created by Krisna Pranav on 13/11/21.
//

/* imports */
import UIKit

/* item cell delegate */
public protocol ItemCellDelegate: AnyObject { }

open class ItemCell: UICollectionViewCell {
    
    open class var reuseIdentifier: String { NSStringFromClass(Self.self) }
    
    open weak var delegate: ItemCellDelegate?
    
    /* layouting  */
    open var layout: AnyItemLayout? {
        didSet {
            if let size = layout?.size, size != itemView.frame.size {
                itemView.frame = CGRect(origin: .zero, size: size)
            }
        }
    }
    
    /* item view */
    public let itemView = UIView()
    
    /* init funcs */
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        itemView.frame = contentView.bounds
        contentView.addSubview(itemView)
    }
}
