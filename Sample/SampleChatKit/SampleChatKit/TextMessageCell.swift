//
//  TextMessageCell.swift
//  SampleChatKitApp
//
//  Created by Apple on 13/11/21.
//

import UIKit
import ChatKit

class TextMessageCell: ItemCell {
    
    let bubbleView = UIView()
    let textView = UITextView()
        
    override var layout: AnyItemLayout? {
        didSet {
            guard let layout = self.layout?.value as? TextMessageLayout else { return }
            bubbleView.frame = layout.bubbleViewFrame
            if layout.item.isOutgoing {
                bubbleView.backgroundColor = #colorLiteral(red: 0.04705882353, green: 0.3882352941, blue: 0.9921568627, alpha: 1)
            } else {
                if #available(iOS 13, *) {
                    bubbleView.backgroundColor = UIColor.systemGray5
                } else {
                    bubbleView.backgroundColor = #colorLiteral(red: 0.8862745098, green: 0.8862745098, blue: 0.8980392157, alpha: 1)
                }
            }
            textView.frame = layout.textViewFrame
            textView.attributedText = layout.attributedString
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        bubbleView.layer.cornerRadius = 18
        bubbleView.clipsToBounds = true
        itemView.addSubview(bubbleView)
        
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.scrollsToTop = false
        textView.textContainerInset = .zero
        textView.textContainer.lineFragmentPadding = 0
        textView.backgroundColor = .clear
        textView.dataDetectorTypes = [.link]
        itemView.addSubview(textView)
    }
}
