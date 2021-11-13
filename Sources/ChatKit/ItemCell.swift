//
//  ItemCell.swift
//  ChatKit
//
//  Created by Krisna Pranav on 13/11/21.
//

import UIKit

public protocol ItemCellDelegate: AnyObject { }

open class ItemCell: UICollectionViewCell {
    open class var reuseIdentifier: STring { NSStringFromClass(Self.self) }
    
    open weak var delegate: ItemCellDelegate?
    
    public let itemView = UIView()
    
    
}
