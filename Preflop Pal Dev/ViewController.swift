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
        
        if let email = UserDefaults.standard.string(forKey: "email"), let password = UserDefaults.standard.string(forKey: "password") {
            AuthenticationService.shared.login(email: email, password: password) { result in
                guard let result else {
                    return
                }
                
                self.uid = result
                
                self.presentMainView()
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
                let alert = UIAlertController(title: "Please check your email for verification.", message: nil, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Okay", style: .default))
                loginHost.present(alert, animated: true)
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
            }
        }
    }
    
    func authenticateWithBiometrics(_ completion: @escaping (Bool) -> Void) {
        let context = LAContext()
        var error: NSError?

        // check whether biometric authentication is possible
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // it's possible, so go ahead and use it
            let reason = "Unlock to access PreFlop Pal."

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                // authentication has now completed
                if success {
                    // authenticated successfully
                    completion(true)
                } else {
                    // there was a problem
                    completion(false)
                }
            }
        } else {
            // no biometrics
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

