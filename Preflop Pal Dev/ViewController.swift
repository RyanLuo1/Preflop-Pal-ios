//
//  ViewController.swift
//  Preflop Pal Dev
//
//  Created by Ryan Luo on 2/10/25.
//

import UIKit
import SwiftUI
import LocalAuthentication

class ViewController: UIViewController {
    
    private var uid: String?
    
    private var mainNavigation: UINavigationController!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let email = UserDefaults.standard.string(forKey: "email"),
           let password = UserDefaults.standard.string(forKey: "password") {
            AuthenticationService.shared.login(email: email, password: password) { result in
                switch result {
                case .success(let uid):
                    self.uid = uid
                    self.presentMainView()
                case .failure(let error):
                    // Handle auto-login failure by showing authentication screen
                    self.presentAuthentication()
                }
            }
        } else {
            presentAuthentication()
        }
    }

    func presentAuthentication() {
        var authenticationNavigation: UINavigationController!
        var host: UIHostingController<AuthenticationView>!
        var vm: AuthenticationViewModel!
        vm = AuthenticationViewModel(action: { action in
            switch action {
            case .login(let uid):
                self.uid = uid
                host.dismiss(animated: true) {
                    self.presentMainView()
                }
//                let alert = UIAlertController(title: "Enable Face ID", message: "Would you like to enable Face ID to login?", preferredStyle: .alert)
//                alert.addAction(UIAlertAction(title: "Not Now", style: .cancel, handler: { _ in
//                    self.presentMainView()
//                }))
//                alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { _ in
//                    self.authenticateForAccess()
//                }))
            case .accountCreated:
                let loginHost = UIHostingController(rootView: LoginView(vm: vm))
                authenticationNavigation.pushViewController(loginHost, animated: true)
            }
        })
        let view = AuthenticationView(vm: vm)
        host = UIHostingController(rootView: view)
        authenticationNavigation = UINavigationController(rootViewController: host)
        authenticationNavigation.modalPresentationStyle = .overFullScreen
        host.navigationController?.setNavigationBarHidden(true, animated: false)
        self.present(authenticationNavigation, animated: true)
    }
    
    func authenticateForAccess() {
        authenticateWithBiometrics { success in
            if success {
                self.presentMainView()
            } else {
                let alert = UIAlertController(title: "Face ID authentication failed.", message: nil, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Try Again", style: .default) { _ in
                    self.authenticateForAccess()
                })
                self.present(alert, animated: true)
            }
        }
    }
    
    func authenticateWithBiometrics(_ completion: @escaping (Bool) -> Void) {
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Unlock to access PreFlop Pal."

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                if success {
                    completion(true)
                } else {
                    completion(false)
                }
            }
        } else {
            completion(true)
        }
    }
    
    func logout() {
        AuthenticationService.shared.logout()
        mainNavigation.dismiss(animated: true)
        presentAuthentication()
    }
    
    func presentMainView() {
        var host: UIHostingController<MainView>!
        let view = MainView(logout: logout)
        host = UIHostingController(rootView: view)
        mainNavigation = UINavigationController(rootViewController: host)
        mainNavigation.modalPresentationStyle = .overFullScreen
        host.navigationController?.setNavigationBarHidden(true, animated: false)
        self.present(mainNavigation, animated: true)
    }
}
