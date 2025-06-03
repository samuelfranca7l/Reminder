//
//  ReminderFlowController.swift
//  Reminder
//
//  Created by Samuel França on 13/05/25.
//

import UIKit
import FirebaseAuth

class ReminderFlowController {
    //MARK: - Properties
    private var navigationController: UINavigationController?
    private let viewControllerFactory: ViewControllersFactoryProtocol

//    private func checkUserAuthentication() {
//        if Auth.auth().currentUser != nil {
//            // Usuário já está autenticado
//            print("usuario logado")
//            navigateToHome()
//        } else {
//            // Usuário não está autenticado
//            print("usuario nao logado")
//            openLoginBottomSheet()
//        }
//    }
    
    
    //MARK: - init
    public init() {
        self.viewControllerFactory = ViewControllersFactory()
    }
    
    //MARK: - startFlow
    func start() -> UINavigationController? {
        let startViewController = viewControllerFactory.makeSplashViewController(flowDelegate: self)
        self.navigationController = UINavigationController(rootViewController: startViewController)

        return navigationController
    }

}

//MARK: - Login

extension ReminderFlowController: LoginBottomSheetFlowDelegate {
    func navigateToHome() {
        self.navigationController?.dismiss(animated: true)
        let viewController = viewControllerFactory.makeHomeViewController(flowDelegate: self)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
//MARK: - Splash

extension ReminderFlowController: SplashFlowDelegate {
    func openLoginBottomSheet() {
        let loginBottomSheet = viewControllerFactory.makeLoginBottomSheetViewController(flowDelegate: self)
        loginBottomSheet.modalPresentationStyle = .overCurrentContext
        loginBottomSheet.modalTransitionStyle = .crossDissolve
        self.navigationController?.present(loginBottomSheet, animated: true)
    }
}

extension ReminderFlowController: HomeFlowDelegate {
    func navigateToRecipesList() {
        let myReceiptsViewController = viewControllerFactory.makeMyReceiptsViewController(flowDelegate: self)
        self.navigationController?.pushViewController(myReceiptsViewController, animated: true)
    }
    
    func navigateToNewRecipes() {
        let receipesViewController = viewControllerFactory.makeNewReceipesViewController(flowDelegate: self)
        self.navigationController?.pushViewController(receipesViewController, animated: true)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func logout() {
        self.navigationController?.popViewController(animated: true)
        self.openLoginBottomSheet()
    }
}

extension ReminderFlowController: MyReceiptsFlowDelegate {
    func didTapBackButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func goToNewReceipts() {
        self.navigateToNewRecipes()
    }
}

extension ReminderFlowController: NewReceiptFlowDelegate {
    
}
