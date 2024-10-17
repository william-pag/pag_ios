//
//  loginViewModel.swift
//  pag_ios
//
//  Created by William Vux on 15/10/24.
//

import Foundation

final class LoginViewModel {
    var isLoading: Observable<Bool> = Observable(false)
    var isChecking: Observable<Bool> = Observable(true)
    var isAuthenticated: Observable<Bool> = Observable(false)
    var errStr: Observable<String> = Observable("")
    
    var email: String
    var password: String
    
    init() {
        self.email = ""
        self.password = ""
    }
    
    func reset() {
        email = ""
        password = ""
    }
    
    func set(email: String, password: String) {
        self.email = email
        self.password = password
    }
    
    private func queryLoginStr() -> String {
        if email.isEmpty || password.isEmpty {
            return ""
        }
        return """
            mutation {
              login(email: "\(email)", password: "\(password)") {
                accessToken
              }
            }
        """
    }
    
    private func queryMe() -> String {
        return """
            {
              me {
                id
                name
                image
                email
                cycleId
              }
            }
        """
    }
    
    func checkAuthentication() {
        guard let token = UserDefaults.standard.string(forKey: "accessToken") else {
            isChecking.value = false
            isAuthenticated.value = false
            return
        }
        ApolloClient.shared.setToken(token)
        ApolloClient.shared.call(body: queryMe()) { (data: Result<MeName, ApolloError>) in
            switch data {
            case .success:
                self.isChecking.value = false
                self.isAuthenticated.value = true
            case .failure:
                self.isChecking.value = false
                self.isAuthenticated.value = false
            }
        }
    }
    
    func login() {
        isLoading.value = true
        errStr.value = ""
        ApolloClient.shared.call(body: queryLoginStr()) { (result: Result<LoginName, ApolloError>) in
            switch result {
            case .success(let data):
                UserDefaults.standard.set(data.login.accessToken, forKey: "accessToken")
                ApolloClient.shared.setToken(data.login.accessToken)
                self.isAuthenticated.value = true
            case .failure(let error):
                self.isAuthenticated.value = false
                self.reset()
                switch error {
                case .invalidResponse(let errStr):
                    self.errStr.value = errStr
                }
            }
            self.isLoading.value = false
        }
    }
}
