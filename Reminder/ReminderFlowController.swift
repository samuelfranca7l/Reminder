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

    private func checkUserAuthentication() {
        if Auth.auth().currentUser != nil {
            // Usuário já está autenticado
            print("usuario logado")
            navigateToHome()
        } else {
            // Usuário não está autenticado
            print("usuario nao logado")
            showLoginBottomSheet()
        }
    }

    //private let viewControllerFactory
    
    
    

    
    
    //MARK: - init
    public init() {
    }
    
    //MARK: - startFlow
    func start() -> UINavigationController? {
        let startViewController = SplashViewController()
        self.navigationController = UINavigationController(rootViewController: startViewController)
        //try? Auth.auth().signOut()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.checkUserAuthentication()
        }
        return navigationController
    }

}

//MARK: - Login
extension ReminderFlowController: LoginBottomSheetFlowDelegate {
    func navigateToHome() {
        self.navigationController?.dismiss(animated: true)
        let viewController = UIViewController()
        viewController.view.backgroundColor = .red
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
//MARK: - Splash

    func showLoginBottomSheet() {
        let loginBottomSheet = LoginBottomSheetViewController(flowDelegate: self)
        loginBottomSheet.modalPresentationStyle = .overCurrentContext
        loginBottomSheet.modalTransitionStyle = .crossDissolve
        self.navigationController?.present(loginBottomSheet, animated: true)
        }
    
}
