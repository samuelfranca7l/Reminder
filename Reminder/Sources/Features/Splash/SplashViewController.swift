//
//  SplashViewController.swift
//  Reminder
//
//  Created by Samuel França on 06/05/25.
//

import Foundation
import UIKit

class SplashViewController: UIViewController {
    
    let contentView = SplashView()
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        self.view.addSubview(contentView)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.view.backgroundColor = Colors.primaryRedBase
        setupConstraints()
    }
    
    private func setupConstraints () {
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

        ])
        contentView.translatesAutoresizingMaskIntoConstraints = false
    }
    
}
