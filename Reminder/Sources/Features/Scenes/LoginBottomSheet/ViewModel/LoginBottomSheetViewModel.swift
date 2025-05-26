//
//  LoginBottomSheetViewModel.swift
//  Reminder
//
//  Created by Samuel França on 11/05/25.
//
import Firebase

class LoginBottomSheetViewModel {
    var successResult: ((String) -> Void)?
    var errorResult: ((String) -> Void)?
    
    func doAuth(usernameLogin: String, password: String) {
        Auth.auth().signIn(withEmail: usernameLogin, password: password) { [weak self] authResult, error in
            if error != nil {
                self?.errorResult?("Erro ao realizar login, verifique as credenciais digitadas")
            } else {
                self?.successResult?(usernameLogin)
            }
        }
    }
}
