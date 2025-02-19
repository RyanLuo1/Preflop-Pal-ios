import FirebaseAuth

enum AuthError: Error {
    case invalidEmail
    case invalidCredentials // New generic case
    case emailAlreadyInUse
    case weakPassword
    case unknown(String)
    
    var message: String {
        switch self {
        case .invalidEmail:
            return "Please enter a valid email address"
        case .invalidCredentials:
            return "Invalid email or password" // Generic message for both cases
        case .emailAlreadyInUse:
            return "An account with this email already exists"
        case .weakPassword:
            return "Password must be at least 6 characters long"
        case .unknown(let message):
            return message
        }
    }
}

class AuthenticationService {
    static let shared = AuthenticationService()
    
    func login(email: String, password: String, completion: @escaping (Result<String, AuthError>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error as NSError? {
                print("DEBUG: Firebase Error Details:")
                print("Code: \(error.code)")
                print("Description: \(error.localizedDescription)")
                print("Error Name: \(error.userInfo["FIRAuthErrorUserInfoNameKey"] ?? "No Name")")
                
                let errorName = error.userInfo["FIRAuthErrorUserInfoNameKey"] as? String ?? ""
                
                switch errorName {
                case "ERROR_INVALID_EMAIL":
                    completion(.failure(.invalidEmail))
                case "ERROR_INVALID_CREDENTIAL":
                    completion(.failure(.invalidCredentials))
                default:
                    completion(.failure(.invalidCredentials))
                }
                return
            }
            
            if let uid = result?.user.uid {
                completion(.success(uid))
            }
        }
    }
    
    func signUp(email: String, password: String, completion: @escaping (Result<String, AuthError>) -> Void) {
        // Basic email format validation
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        
        if !emailPredicate.evaluate(with: email) {
            completion(.failure(.invalidEmail))
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error as NSError? {
                switch error.code {
                case AuthErrorCode.emailAlreadyInUse.rawValue:
                    completion(.failure(.emailAlreadyInUse))
                case AuthErrorCode.invalidEmail.rawValue:
                    completion(.failure(.invalidEmail))
                case AuthErrorCode.weakPassword.rawValue:
                    completion(.failure(.weakPassword))
                default:
                    completion(.failure(.unknown(error.localizedDescription)))
                }
                return
            }
            
            if let uid = result?.user.uid {
                completion(.success(uid))
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
