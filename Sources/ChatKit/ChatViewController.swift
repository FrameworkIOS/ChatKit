//
//  ChatViewController.swift
//  ChatKit
//
//  Created by Apple on 13/11/21.
//

import UIKit

open class ChatViewController: UIViewController {
    open var layouts: [AnyItemLayout] = []
    
    private var cellRegisterTable: [String: Bool] = [:]
    
    open var cellWidth: CGFloat {
        assert(Thread.isMainThread)
        return collectionView.bounds.width - collectionView.contentInset.left - collectionView.contentInset.right
    }
    open var safeAreaInsets: UIEdgeInsets { view.safeAreaInsets }
    
    public let containerView = ContainerView()
    public let backgroundView = UIImageView()
    
    public var collectionView: ItemsView
    public var collectionViewLayout = ItemsViewLayout()
    public let scrollProxy = UIScrollView()
    
    public var inputPanel: InputPanel
    open var inputPanelDefaultHeight: CGFloat = 0

    private var isRegisterKeyboardNotifications: Bool = false
    open var halfTransitionKeyboardHeight: CGFloat = 0
    open var keyboardHeight: CGFloat = 0
    open var isRotating: Bool = false
    
    open var isAutoInControllerTransition: Bool = true
    open var isInControllerTransition: Bool = false
    
    private var isFirstLayout: Bool = true
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.collectionView = ItemsView(frame: .zero, collectionViewLayout: collectionViewLayout)
        self.inputPanel = InputPanel()
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.hidesBottomBarWhenPushed = true
    }
    
    public required init?(coder: NSCoder) {
        self.collectionView = ItemsView(frame: .zero, collectionViewLayout: collectionViewLayout)
        self.inputPanel = InputPanel()
        super.init(coder: coder)
        self.hidesBottomBarWhenPushed = true
    }
    
    deinit {
        unregisterKeyboardNotifications()
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        setupBackgroundView()
        setupScrollProxy()
        setupContainerView()
        setupCollectionView()
        setupInputPanel()
        registerKeyboardNotifications()
    }
    
    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        containerView.frame = view.bounds
        if isFirstLayout {
            defer { isFirstLayout = false }
            layoutInputPanel()
            adjustCollectionViewInsets()
        }
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if isAutoInControllerTransition {
            isInControllerTransition = false
        }
    }
    
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if isAutoInControllerTransition {
            isInControllerTransition = true
        }
    }
}
