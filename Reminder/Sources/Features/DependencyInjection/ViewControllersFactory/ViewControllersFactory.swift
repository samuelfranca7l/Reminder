//
//  ViewControllersFactory.swift
//  Reminder
//
//  Created by Samuel França on 14/05/25.
//

import UIKit

final class ViewControllersFactory: ViewControllersFactoryProtocol {
    
    func makeMyReceiptsViewController(flowDelegate: MyReceiptsFlowDelegate) -> MyReceiptsViewController {
        let contentView = MyReceiptsView()
        let viewController = MyReceiptsViewController(contentView: contentView,
                                                      flowDelegate: flowDelegate)
        return viewController
    }
    
    func makeNewReceipesViewController(flowDelegate: NewReceiptFlowDelegate) -> NewReceiptViewController {
        let contentView = NewReceiptView()
        let viewController = NewReceiptViewController(contentView: contentView,
                                                      flowDelegate: flowDelegate)
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
