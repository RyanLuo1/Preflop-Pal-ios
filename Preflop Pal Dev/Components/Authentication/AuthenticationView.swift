import SwiftUI

enum AuthenticationViewAction {
    case login(String)
    case accountCreated
}

class AuthenticationViewModel: ObservableObject {
    let action: (AuthenticationViewAction) -> Void
    
    init(action: @escaping (AuthenticationViewAction) -> Void) {
        self.action = action
    }
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var passwordConfirm: String = ""
    @Published var rememberMe: Bool = true
    
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    func login(_ email: String, _ password: String) {
        if isLoading { return }
        self.isLoading = true
        AuthenticationService.shared.login(email: email, password: password) { [weak self] result in
            guard let self else { return }
            self.isLoading = false
            
            switch result {
            case .success(let uid):
                if rememberMe {
                    UserDefaults.standard.set(email, forKey: "email")
                    UserDefaults.standard.set(password, forKey: "password")
                } else {
                    UserDefaults.standard.set(nil, forKey: "email")
                    UserDefaults.standard.set(nil, forKey: "password")
                }
                self.action(.login(uid))
            case .failure(let error):
                self.errorMessage = error.message
            }
        }
    }
    
    func createAccount(_ email: String, _ password: String) {
        if isLoading { return }
        
        guard password == passwordConfirm else {
            errorMessage = "Passwords do not match"
            return
        }
        
        self.isLoading = true
        AuthenticationService.shared.signUp(email: email, password: password) { [weak self] result in
            guard let self else { return }
            self.isLoading = false
            
            switch result {
            case .success:
                self.action(.accountCreated)
            case .failure(let error):
                self.errorMessage = error.message
            }
        }
    }
}

struct AuthenticationView: View {
    @StateObject var vm: AuthenticationViewModel
    @State var errorAlertIsPresented: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Image("full_logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300)
                    .padding(.top, 60)
                    .padding(.bottom, 20)
                
                NavigationLink(destination: LoginView(vm: vm)) {
                    Text("LOGIN")
                        .font(.roboto(size: 16, weight: .bold))
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 45)
                        .background(Colors.tintColorPrimary)
                        .cornerRadius(10)
                        .shadow(color: .black.opacity(0.15), radius: 2, y: 2)
                }
                
                NavigationLink(destination: SignUpView(vm: vm)) {
                    Text("SIGN UP")
                        .font(.roboto(size: 16, weight: .bold))
                        .foregroundStyle(Colors.tintColorPrimary)
                        .frame(maxWidth: .infinity)
                        .frame(height: 45)
                        .background(.white)
                        .cornerRadius(10)
                        .shadow(color: .black.opacity(0.15), radius: 2, y: 2)
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Colors.tintColorPrimary, lineWidth: 2)
                                .padding(1)
                        }
                }
                
                Spacer()
            }
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Colors.tintColorLight)
        }
        .accentColor(Colors.tintColorDark)
        .onChange(of: vm.errorMessage) { errorMessage in
            if let errorMessage {
                errorAlertIsPresented.toggle()
            }
        }
        .alert(vm.errorMessage ?? "", isPresented: $errorAlertIsPresented, actions: {
            Button {
                vm.errorMessage = nil
            } label: {
                Text("Okay")
            }
        })
        .preferredColorScheme(.light)
        .colorScheme(.light)
    }
}

struct LoginView: View {
    @StateObject var vm: AuthenticationViewModel
    @State private var showPassword: Bool = false
    
    var body: some View {
        VStack(spacing: 40) {
            Image("logo_only")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100)
                .padding(.top, 20)
                .padding(.bottom, 20)
            
            VStack(spacing: 20) {
                TextField("Email", text: $vm.email)
                    .textContentType(.emailAddress)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    .padding(12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(style: StrokeStyle(lineWidth: 1))
                            .foregroundColor(Colors.tintColorPrimary)
                    )
                
                HStack {
                    if showPassword {
                        TextField("Password", text: $vm.password)
                            .textContentType(.password)
                    } else {
                        SecureField("Password", text: $vm.password)
                            .textContentType(.password)
                    }
                    
                    Button(action: {
                        showPassword.toggle()
                    }) {
                        Image(systemName: showPassword ? "eye.fill" : "eye.slash.fill")
                            .foregroundColor(Colors.tintColorPrimary)
                    }
                }
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
                .padding(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(style: StrokeStyle(lineWidth: 1))
                        .foregroundColor(Colors.tintColorPrimary)
                )
            }
            .opacity(vm.isLoading ? 0.25 : 1)
            .overlay {
                if vm.isLoading {
                    ProgressView()
                }
            }
            
            HStack {
                Toggle("", isOn: $vm.rememberMe)
                    .labelsHidden()
                    .tint(Colors.tintColorPrimary)
                Text("Remember Me")
                    .font(.roboto(size: 16, weight: .regular))
                Spacer()
            }
            
            Button {
                vm.login(vm.email, vm.password)
            } label: {
                Text("LOGIN")
                    .font(.roboto(size: 16, weight: .bold))
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 45)
                    .background(Colors.tintColorPrimary)
                    .cornerRadius(10)
                    .shadow(color: .black.opacity(0.15), radius: 2, y: 2)
            }
            
            Spacer()
        }
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Colors.tintColorLight)
        .preferredColorScheme(.light)
        .colorScheme(.light)
    }
}

struct SignUpView: View {
    @StateObject var vm: AuthenticationViewModel
    @State private var showPassword: Bool = false
    @State private var showConfirmPassword: Bool = false
    
    var body: some View {
        VStack(spacing: 40) {
            Image("logo_only")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100)
                .padding(.top, 20)
            
            Text("Welcome to PreFlop Pal")
                .font(.roboto(size: 20, weight: .bold))
                .foregroundStyle(Colors.tintColorDark)
                .padding(.bottom, 10)
            
            VStack(spacing: 20) {
                TextField("Email", text: $vm.email)
                    .textContentType(.emailAddress)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    .padding(12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(style: StrokeStyle(lineWidth: 1))
                            .foregroundColor(Colors.tintColorPrimary)
                    )
                
                HStack {
                    if showPassword {
                        TextField("Password", text: $vm.password)
                            .textContentType(.newPassword)
                    } else {
                        SecureField("Password", text: $vm.password)
                            .textContentType(.newPassword)
                    }
                    
                    Button(action: {
                        showPassword.toggle()
                    }) {
                        Image(systemName: showPassword ? "eye.fill" : "eye.slash.fill")
                            .foregroundColor(Colors.tintColorPrimary)
                    }
                }
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
                .padding(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(style: StrokeStyle(lineWidth: 1))
                        .foregroundColor(Colors.tintColorPrimary)
                )

                HStack {
                    if showConfirmPassword {
                        TextField("Confirm Password", text: $vm.passwordConfirm)
                            .textContentType(.password)
                    } else {
                        SecureField("Confirm Password", text: $vm.passwordConfirm)
                            .textContentType(.password)
                    }
                    
                    Button(action: {
                        showConfirmPassword.toggle()
                    }) {
                        Image(systemName: showConfirmPassword ? "eye.fill" : "eye.slash.fill")
                            .foregroundColor(Colors.tintColorPrimary)
                    }
                }
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
                .padding(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(style: StrokeStyle(lineWidth: 1))
                        .foregroundColor(Colors.tintColorPrimary)
                )
            }
            .opacity(vm.isLoading ? 0.25 : 1)
            .overlay {
                if vm.isLoading {
                    ProgressView()
                }
            }
            
            Button {
                vm.createAccount(vm.email, vm.password)
            } label: {
                Text("SIGN UP")
                    .font(.roboto(size: 16, weight: .bold))
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 45)
                    .background(Colors.tintColorPrimary)
                    .cornerRadius(10)
                    .shadow(color: .black.opacity(0.15), radius: 2, y: 2)
            }
            
            Spacer()
        }
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Colors.tintColorLight)
        .preferredColorScheme(.light)
        .colorScheme(.light)
    }
}

#Preview {
    AuthenticationView(
        vm: AuthenticationViewModel(action: { _ in })
    )
}
