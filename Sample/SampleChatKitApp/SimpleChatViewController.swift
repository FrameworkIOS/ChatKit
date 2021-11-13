//
//  SimpleChatViewController.swift
//  SampleChatKitApp
//
//  Created by Apple on 13/11/21.
//

import UIKit
import ChatKit

class SimpleChatViewController: ChatViewController {
    
    private let dataSource = SimpleChatDataSource()
    
    private var inputCoordinator: SimpleInputCoordinator!
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.inputPanel = SimpleInputPanel()
        self.inputPanelDefaultHeight = SimpleInputPanel.Layout.baseHeight
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Simple"
        inputCoordinator = SimpleInputCoordinator(chatViewController: self)
        dataSource.chatViewController = self
        dataSource.loadMessages()
    }
    
}

extension SimpleChatViewController: SimpleInputPanelDelegate {
    
    func didInputTextPanelStartInputting(_ inputTextPanel: SimpleInputPanel) {
        if !collectionView.isScrolledAtBottom {
            collectionView.scrollToBottom(animated: true)
        }
    }
    
    func inputTextPanel(_ inputTextPanel: SimpleInputPanel, requestSendText text: String) {
        let msg = Message.text(from: "me", content: text)
        dataSource.send(message: msg)
    }

}


class SimpleChatDataSource {
    
    weak var chatViewController: SimpleChatViewController?
    
    private let layoutQueue: OperationQueue = {
        let queue = OperationQueue()
        queue.maxConcurrentOperationCount = 1
        queue.qualityOfService = .userInitiated
        queue.name = "simple-chat-layout"
        return queue
    }()
    
    func loadMessages() {
        let messages: [Message] = [
            Message.text(from: "bot", content: "ChatKit is a lightweight chat UI framework which has no particular faces."),
            Message.text(from: "bot", content: """
            - Inverted mode
            - Adaptive user interface
            - Custom chat items and input panel
            - Simple MVC pattern
            """)
        ]
        appendMessages(messages, scrollToBottom: true, animated: false, isLoad: true)
    }
    
    func send(message: Message) {
        appendMessages([message], scrollToBottom: true, animated: true)
    }
    
    private func appendMessages(_ messages: [Message], scrollToBottom: Bool, animated: Bool, isLoad: Bool = false) {
        guard let vc = self.chatViewController else { return }
        let width = vc.cellWidth
        layoutQueue.addOperation { [weak vc] in
            guard let strongVC = vc else { return }
            let count = strongVC.layouts.count
            var insertLayouts = [AnyItemLayout]()
            for message in messages {
                var layout = TextMessageLayout(item: message)
                layout.calculate(preferredWidth: width)
                insertLayouts.append(layout.toAny())
            }
            let insertIndexPathes: [IndexPath] = (count ..< (count + insertLayouts.count)).map { IndexPath(item: $0, section: 0) }
            OperationQueue.main.addOperation {
                strongVC.layouts.append(contentsOf: insertLayouts)
                strongVC.collectionView.performChange(.init(insertIndexPathes: insertIndexPathes), animated: animated)
                if scrollToBottom {
                    strongVC.collectionView.scrollToBottom(animated: animated)
                }
            }
        }
    }
}
