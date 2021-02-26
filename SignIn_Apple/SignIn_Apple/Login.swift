//
//  Login.swift
//  SignIn_Apple
//
//  Created by Maxim Granchenko on 26.02.2021.
//

import SwiftUI
import AuthenticationServices

struct Login: View {
    
    @StateObject var loginViewModel = LoginViewModel()
    
    var body: some View {
        ZStack {
            Image("2")
                .resizable()
                .frame(width: UIScreen.main.bounds.width)
                .ignoresSafeArea()
            
            VStack(spacing: 25) {
                Text("Unsplash")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 20, content: {
                    Text("Larges\nImages Library")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text(" Предложение действует с 15 февраля по 5 марта при покупке iPad, iPhone или Apple Watch. Предложение ограничено, наличие не гарантируется.")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                })
                .padding(.horizontal, 30)
                
                Spacer()
                
                SignInWithAppleButton { request in
                    loginViewModel.nonce = randomNonceString()
                    request.requestedScopes = [.email, .fullName]
                    request.nonce = sha256(loginViewModel.nonce)
                } onCompletion: { result in
                    switch result {
                    case .success(let user):
                        guard let credential = user.credential as? ASAuthorizationAppleIDCredential else {
                            fatalError("Credential failed")
                            return
                        }
                        
                        loginViewModel.authorisation(credential: credential)
                    case .failure(let error):
                        fatalError("Failed request \(error.localizedDescription)")
                    }
                }
                .signInWithAppleButtonStyle(.white)
                .frame(maxWidth: .infinity, maxHeight: 50)
                .clipShape(Capsule())
                .padding(.horizontal, 40)
                .offset(y: -50)
            }
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
