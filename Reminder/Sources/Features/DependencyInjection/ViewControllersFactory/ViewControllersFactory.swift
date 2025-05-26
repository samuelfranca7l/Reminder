//
//  ViewControllersFactory.swift
//  Reminder
//
//  Created by Samuel França on 14/05/25.
//

import UIKit

final class ViewControllersFactory: ViewControllersFactoryProtocol {
    func makeNewReceipesViewController() -> NewReceiptViewController {
        let viewController = NewReceiptViewController()
        return viewController
    }
    
    func makeSplashViewController(flowDelegate: SplashFlowDelegate) -> SplashViewController {
        let contentView = SplashView()
        let viewController = SplashViewController(contentView: contentView,
                                                  flowDelegate: flowDelegate)
        return viewController
    }
    
    func makeLoginBottomSheetViewController(flowDelegate: LoginBottomSheetFlowDelegate) -> LoginBottomSheetViewController {
        let contentView = LoginBottomSheetView()
        let viewController = LoginBottomSheetViewController(contentView: contentView,
                                                            flowDelegate: flowDelegate)
        return viewController
    }
    
    func makeHomeViewController(flowDelegate: HomeFlowDelegate) -> HomeViewController {
        let contentView = HomeView()
        let viewController = HomeViewController(contentView: contentView,
                                                flowDelegate: flowDelegate)
        return viewController
    }
}
