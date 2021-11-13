//
//  InputPanel.swift
//  ChatKit
//
//  Created by Krisna Pranav on 13/11/21.
//

import UIKit

public protocol InputPanelDelegate: AnyObject {
    func inputPanel(_ inputPanel: InputPanel, willChange height: CGFloat, duration: TimeInterval, animationCurve: Int)
}

open class InputPanel: UIView {
    
    open weak var delegate: InputPanelDelegate?
    
    open func endInputting(animated: Bool) {
        
    }
    
    open func adjust(for size: CGSize, keyboardHeight: CGFloat, duration: TimeInterval, animationCurve: Int) {
        
    }
    
    open func change(to size: CGSize, keyboardHeight: CGFloat, duration: TimeInterval) {
        
    }
    
}
