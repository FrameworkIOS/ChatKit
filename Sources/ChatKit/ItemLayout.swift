//
//  ItemLayout.swift
//  ChatKit
//
//  Created by Apple on 13/11/21.
//

import UIKit

public protocol Identifiable {
    var uniqueIdentifier: String { get }
}


public enum CellRegister {
    case `class`(AnyClass?)
    case nib(UINib?)
}

public protocol CellReuseIdentifiable {
    var cellReusableIdentifier: String { get }
    var cellRegister: CellRegister { get }
}

public protocol SizeCalculator {
    var size: CGSize { get }
}

public protocol ItemLayout: Identifiable, CellReuseIdentifiable, SizeCalculator {
    associatedtype Item: Identifiable
    var item: Item { get }
    init(item: Item)
}

public struct AnyItemLayout: Identifiable, CellReuseIdentifiable, SizeCalculator {
    
    
}

public extension ItemLayout {
    func toAny() -> AnyItemLayout {
        return AnyItemLayout(layout: self)
    }
}
