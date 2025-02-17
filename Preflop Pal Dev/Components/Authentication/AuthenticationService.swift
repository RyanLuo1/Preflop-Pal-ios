//
//  AuthenticationService.swift
//  Preflop Pal Dev
//
//  Created by Ryan Luo on 2/10/25.
//

import FirebaseAuth

class AuthenticationService {
    static let shared = AuthenticationService()
    
    func login(email: String, password: String, completion: @escaping (String?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let result {
                completion(result.user.uid)
            } else {
                completion(nil)
            }
        }
    }
    
    func signUp(email: String, password: String, completion: @escaping (String?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let result {
                completion(result.user.uid)
            } else {
                completion(nil)
            }
        }
    }
    
    func logout() {
        UserDefaults.standard.set(nil, forKey: "email")
        UserDefaults.standard.set(nil, forKey: "password")
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
    }
}
