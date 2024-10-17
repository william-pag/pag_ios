//
//  LoginViewController.swift
//  pag_ios
//
//  Created by William Vux on 15/10/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let loginViewModel: LoginViewModel = LoginViewModel()

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var btnLoginView: UIButton!
    @IBOutlet weak var txtError: UILabel!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var viewChecking: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        bindViewModel()
        bindData()
    }
    
    private func setupView() {
        btnLoginView.layer.cornerRadius = 50
    }
    private func bindViewModel() {
        loginViewModel.isLoading.bind { value in
            if let value {
                self.btnLoginView.configuration?.showsActivityIndicator = value
            } else {
                self.btnLoginView.configuration?.showsActivityIndicator = true
            }
        }
        
        loginViewModel.isAuthenticated.bind { value in
            if value == true {
                let mainView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainTabbarController")
                self.view.window?.rootViewController = mainView
                self.view.window?.makeKeyAndVisible()
            }
        }
        
        loginViewModel.errStr.bind { data in
            self.txtError.text = data
        }
        
        loginViewModel.isChecking.bind { value in
            if value != true {
                self.viewChecking.isHidden = true
                self.indicator.stopAnimating()
            }
        }
    }
    
    private func bindData() {
        loginViewModel.checkAuthentication()
    }

    @IBAction func btnLogin(_ sender: UIButton) {
        guard let email = txtEmail.text, !email.isEmpty else { return }
        guard let password = txtPassword.text, !password.isEmpty else { return }
        loginViewModel.set(email: email, password: password)
        loginViewModel.login()
    }
}
