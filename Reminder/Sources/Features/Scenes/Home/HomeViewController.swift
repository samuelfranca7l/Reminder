//
//  HomeViewController.swift
//  Reminder
//
//  Created by Samuel França on 15/05/25.
//

import UIKit

class HomeViewController: UIViewController {
    let viewModel = HomeViewModel()
    let contentView: HomeView
    var handleAreaHeight: CGFloat = 50.0
    public weak var flowDelegate: HomeFlowDelegate?
    
    init(contentView: HomeView,
         flowDelegate: HomeFlowDelegate) {
        self.contentView = contentView
        self.flowDelegate = flowDelegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    
    private func setup() {
        view.addSubview(contentView)
        buildHierarchy()
    }
    
    private func buildHierarchy() {
        setupContentViewToBounds(contentView: contentView)
    }
}
